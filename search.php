<?php
// --- Connect to the database ---
$conn = new mysqli("localhost", "root", "", "travel_site");
if ($conn->connect_error) die("Connection failed: " . $conn->connect_error);

// --- Get filters from the URL ---
$city = $_GET['city'] ?? '';
$duration = $_GET['duration'] ?? '';
$time_of_day = $_GET['time_of_day'] ?? '';
$activity_type = $_GET['activity_type'] ?? '';
$min_price = $_GET['min_price'] ?? 0;
$max_price = $_GET['max_price'] ?? 200;
$start_date = $_GET['start_date'] ?? '';
$end_date = $_GET['end_date'] ?? '';

// --- Build the SQL query dynamically based on selected filters ---
$sql = "SELECT * FROM activities WHERE 1=1";
if ($city !== '') $sql .= " AND city = '$city'";
if ($duration !== '') $sql .= " AND duration = '$duration'";
if ($time_of_day !== '') $sql .= " AND time_of_day = '$time_of_day'";
if ($activity_type !== '') $sql .= " AND activity_type = '$activity_type'";
$sql .= " AND price BETWEEN $min_price AND $max_price";
if ($start_date !== '') $sql .= " AND date >= '$start_date'";
if ($end_date !== '') $sql .= " AND date <= '$end_date'";
$result = $conn->query($sql);

// --- Load filter options (distinct values for dropdowns) ---
$filters = ['city' => [], 'duration' => [], 'time_of_day' => [], 'activity_type' => []];
foreach ($filters as $col => &$values) {
  $res = $conn->query("SELECT DISTINCT $col FROM activities ORDER BY $col");
  while ($row = $res->fetch_assoc()) $values[] = $row[$col];
}
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Showing activities</title>
  <link rel="stylesheet" href="Homestyle.css">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Inter&display=swap" rel="stylesheet">

  <style>
    /* --- General styling for layout and UI --- */
    body {
      font-family: 'Inter', sans-serif;
      background-color:rgb(255, 255, 255);
      padding: 0 20px;
    }
    .card-container {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
    }
    .card {
      background: white;
      border-radius: 10px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      width: 250px;
      cursor: pointer;
    }
    .card:hover { transform: scale(1.02); }
    .card-img-top {
      width: 100%;
      height: 160px;
      object-fit: cover;
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;
    }
    .card-body { padding: 15px; }
    .card-title { font-size: 18px; font-weight: bold; }
    .card-text { font-size: 14px; color: #555; }

    /* --- Filters layout --- */
    form.filters {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      margin-bottom: 25px;
      align-items: center;
    }
    form.filters select,
    input[type="range"],
    input[type="date"] {
      padding: 6px 10px;
      border-radius: 6px;
      border: 1px solid #ccc;
    }

    /* --- Range slider styles --- */
    input[type="range"] {
      -webkit-appearance: none;
      height: 6px;
      background: #ccc;
      border-radius: 3px;
      flex: 1;
    }
    input[type="range"]::-webkit-slider-thumb {
      -webkit-appearance: none;
      height: 18px;
      width: 18px;
      border-radius: 50%;
      background: white;
      border: 2px solid #999;
      cursor: pointer;
    }

    /* --- Modal styles for activity popup --- */
    .modal {
      display: none;
      position: fixed;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background-color: rgba(0,0,0,0.5);
      justify-content: center;
      align-items: center;
      z-index: 1000;
    }
    .modal-content {
      background: white;
      border-radius: 10px;
      padding: 20px;
      max-width: 500px;
      width: 90%;
      max-height: 90vh;
      overflow-y: auto;
    }
    .modal img {
      width: 100%;
      border-radius: 10px;
      margin-bottom: 15px;
    }
    .close-btn {
      float: right;
      font-size: 20px;
      cursor: pointer;
      color: red;
    }
    .book-button {
      background-color: #28a745;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      font-weight: bold;
      cursor: pointer;
    }
    .book-button:hover { background-color: #218838; }
    #bookingForm input {
      width: 100%;
      padding: 8px;
      margin-bottom: 10px;
      box-sizing: border-box;
    }
  </style>
</head>
<body>

<!-- --- Header bar --- -->
<header>
  <div class="logo">
  <a href="home.html">
      <img src="images/travel.png" alt="TravelWise Logo" class="logo-img">
    </a>
  </div>
  <nav>
    <ul>
      <li><a href="reviews.html">Reviews</a></li>
      <li><a href="gallery.html">Gallery</a></li>
      <li><a href="faq.html">FAQ</a></li>
    </ul>
  </nav>
</header>
<div style="height: 90px;"></div>

<h2>Showing activities</h2>

<!-- --- Filter Form --- -->
<form method="GET" class="filters" style="display:flex;flex-wrap:wrap;gap:15px;align-items:center;margin-bottom:20px;">
  <?php foreach ($filters as $name => $options): ?>
    <label><?= ucfirst(str_replace("_", " ", $name)) ?>:</label>
    <select name="<?= $name ?>" onchange="this.form.submit()">
      <option value="">All</option>
      <?php foreach ($options as $opt): ?>
        <option value="<?= $opt ?>" <?= ($$name == $opt) ? 'selected' : '' ?>><?= htmlspecialchars($opt) ?></option>
      <?php endforeach; ?>
    </select>
  <?php endforeach; ?>

  <!-- ✅ From/To Date Filters (moved before price) -->
  <label>From:</label>
  <input type="date" name="start_date" value="<?= htmlspecialchars($start_date) ?>" onchange="this.form.submit()">
  <label>To:</label>
  <input type="date" name="end_date" value="<?= htmlspecialchars($end_date) ?>" onchange="this.form.submit()">

  <!-- ✅ Unified Price Slider -->
  <div class="range-slider">
    <label>Price ($):</label>
    <div class="slider-container">
      <input type="range" id="minPrice" name="min_price" min="0" max="200" value="<?= $min_price ?>" oninput="updateSlider()">
      <input type="range" id="maxPrice" name="max_price" min="0" max="200" value="<?= $max_price ?>" oninput="updateSlider()">
      <div id="slider-track"></div>
    </div>
    <div id="priceRangeValue">$<?= $min_price ?> – $<?= $max_price ?></div>
  </div>
</form>


<!-- --- Activity Cards --- -->
<div class="card-container">
<?php if ($result && $result->num_rows > 0): while($row = $result->fetch_assoc()): 
  $jsonData = htmlspecialchars(json_encode($row), ENT_QUOTES, 'UTF-8');
?>
  <div class="card" onclick='showModal(<?= $jsonData ?>)'>
    <img src="<?= $row['image_url'] ?>" class="card-img-top" alt="<?= $row['activity_name'] ?>">
    <div class="card-body">
      <div class="card-title"><?= $row['activity_name'] ?></div>
      <div class="card-text"><?= $row['description'] ?></div>
    </div>
  </div>
<?php endwhile; else: ?>
  <p>No matching activities found.</p>
<?php endif; ?>
</div>

<!-- --- Modal for Activity Detail & Booking --- -->
<div id="activityModal" class="modal" onclick="closeModal(event)">
  <div class="modal-content">
    <span class="close-btn" onclick="document.getElementById('activityModal').style.display='none'">&times;</span>
    <img id="modalImage" src="" alt="">
    <h3 id="modalTitle"></h3>
    <p id="modalDesc"></p>
    <p><strong>City:</strong> <span id="modalCity"></span></p>
    <p><strong>Price:</strong> $<span id="modalPrice"></span></p>
    <p><strong>Duration:</strong> <span id="modalDuration"></span></p>
    <p><strong>Date:</strong> <span id="modalDate"></span></p>
    <p><strong>Time of Day:</strong> <span id="modalTime"></span></p>
    <p><strong>Activity Type:</strong> <span id="modalType"></span></p>

    <hr>
    <h4>Book Now</h4>
    <form id="bookingForm" onsubmit="submitBooking(event)">
      <input type="hidden" id="activityIdField">
      <label>Name:</label>
      <input type="text" id="name" required>
      <label>Email:</label>
      <input type="email" id="email" required>
      <label>Number of Guests:</label>
      <input type="number" id="guests" value="1" min="1" required>
      <button type="submit" class="book-button">Submit Booking</button>
    </form>

    <div id="bookingSuccess" style="display:none; margin-top: 15px; color: green; font-weight: bold;">
      ✅ Your booking has been submitted. Have fun!
    </div>
  </div>
</div>

<!-- --- Scripts for modal and sliders --- -->
<script>
function showModal(data) {
  document.getElementById('modalImage').src = data.image_url;
  document.getElementById('modalTitle').innerText = data.activity_name;
  document.getElementById('modalDesc').innerText = data.description;
  document.getElementById('modalCity').innerText = data.city;
  document.getElementById('modalPrice').innerText = data.price;
  document.getElementById('modalDuration').innerText = data.duration;
  const [year, month, day] = data.date.split("-");
  document.getElementById('modalDate').innerText = `${month}/${day}/${year}`;
  document.getElementById('modalTime').innerText = data.time_of_day;
  document.getElementById('modalType').innerText = data.activity_type;
  document.getElementById('activityIdField').value = data.id;
  document.getElementById('bookingForm').reset();
  document.getElementById('bookingSuccess').style.display = 'none';
  document.getElementById('activityModal').style.display = 'flex';
}
function closeModal(event) {
  if (event.target.id === 'activityModal') {
    document.getElementById('activityModal').style.display = 'none';
  }
}
function submitBooking(event) {
  event.preventDefault();
  document.getElementById('bookingSuccess').style.display = 'block';
  document.getElementById('bookingForm').reset();
}
function syncPrices() {
  let min = parseInt(document.getElementById('min_price').value);
  let max = parseInt(document.getElementById('max_price').value);
  if (min > max) {
    [min, max] = [max, min]; // Swap to maintain valid range
    document.getElementById('min_price').value = min;
    document.getElementById('max_price').value = max;
  }
  document.getElementById('priceLabel').innerText = `$${min} – $${max}`;
}
window.onload = syncPrices;
</script>
</body>
</html>

<?php $conn->close(); ?>

