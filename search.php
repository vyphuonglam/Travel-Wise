<?php
// Establishing connection to the MySQL database (travel_site)
$conn = new mysqli("localhost", "root", "", "travel_site");

// Check if the connection is successful
if ($conn->connect_error) die("Connection failed: " . $conn->connect_error);

// Variable to track if booking is successful
$showSuccess = false;

// If the form is submitted via POST request, process the booking
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['submit_booking'])) {
    // Retrieving form data  
    $activity_id = $_POST['activity_id'];
    $activity_name = $_POST['activity_name'];
    $city = $_POST['city'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $guests = $_POST['guests'];

    // Prepare SQL query to insert booking data into the 'customers' table
    $stmt = $conn->prepare("INSERT INTO customers (activity_id, activity_name, city, name, email, guests) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("issssi", $activity_id, $activity_name, $city, $name, $email, $guests);
    $stmt->execute();
    $stmt->close();

    // Set flag to show success message
    $showSuccess = true;
}

// Retrieving filter values from URL query parameters (GET)
$city = $_GET['city'] ?? '';
$duration = $_GET['duration'] ?? '';
$time_of_day = $_GET['time_of_day'] ?? '';
$activity_type = $_GET['activity_type'] ?? '';
$price_range = $_GET['price_range'] ?? '';
$start_date = $_GET['start_date'] ?? '';
$end_date = $_GET['end_date'] ?? '';

// Set price range values based on the filter chosen
switch ($price_range) {
  case 'under50': $min_price = 0; $max_price = 49; break;
  case '50to100': $min_price = 50; $max_price = 100; break;
  case '100plus': $min_price = 101; $max_price = 10000; break;
  default: $min_price = 0; $max_price = 10000; // Default range: all prices
}


// Construct SQL query to fetch activities from the database based on filters
$sql = "SELECT * FROM activities WHERE 1=1";
if ($city !== '') $sql .= " AND city = '$city'";  // Filter by city
if ($duration !== '') $sql .= " AND duration = '$duration'"; // Filter by durataion
if ($time_of_day !== '') $sql .= " AND time_of_day = '$time_of_day'";  // Filter by time of day
if ($activity_type !== '') $sql .= " AND activity_type = '$activity_type'";  // Filter by activity type
$sql .= " AND price BETWEEN $min_price AND $max_price";  // Filter by price range
if ($start_date !== '') $sql .= " AND date >= '$start_date'";  // Filter by start date
if ($end_date !== '') $sql .= " AND date <= '$end_date'";  // Filter by end date
$result = $conn->query($sql);  // Execute the SQL query

// Fetch distinct filter values for dropdown menus
$filters = ['city' => [], 'duration' => [], 'time_of_day' => [], 'activity_type' => []];
foreach ($filters as $col => &$values) {
   // Fetch distinct values for each filter column
  $res = $conn->query("SELECT DISTINCT $col FROM activities ORDER BY $col");
  while ($row = $res->fetch_assoc()) $values[] = $row[$col];
}

?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Results for '<?= htmlspecialchars($city) ?>'</title>
  <link rel="stylesheet" href="Homestyle.css">
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Inter&display=swap" rel="stylesheet">
  <style>
    <style>
    body {
      font-family: 'Inter', sans-serif;
      background: #f5f7fa;
      padding: 0 20px;
    }

    /* Styles for the heading */
    h2 {
      font-size: 28px;
      font-weight: bold;
      margin-bottom: 20px;
    }

    /* Grid layout for displaying cards */
    .card-container {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 20px;
    }

     /* Style for each activity card */
    .card {
      background: white;
      border-radius: 16px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.1);
      transition: transform 0.2s ease, box-shadow 0.2s ease;
      overflow: hidden;
    }

     /* Hover effect for cards */
    .card:hover {
      transform: translateY(-4px);
    }

       /* Style for card images */
    .card-img-top {
      width: 100%;
      height: 160px;
      object-fit: cover;
      border-top-left-radius: 16px;
      border-top-right-radius: 16px;
    }

     /* Body content of each card */
    .card-body {
      padding: 15px;
    }

    /* Title of each card */
    .card-title {
      font-size: 20px;
      font-weight: bold;
      font-family: 'Playfair Display', serif;
      color: #1e1e1e;
      margin-bottom: 8px;
    }

    /* Text description of each card */
    .card-text {
      font-size: 15px;
      line-height: 1.5;
      color: #4a4a4a;
    }

      /* Text description of each card */
    form.filters {
      background: white;
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.08);
      display: flex;
      flex-direction: column;
      gap: 15px;
      margin-bottom: 30px;
    }

     /* Filter row for layout */
    .filter-row {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      align-items: center;
    }

    /* Label styles for filters */
    form.filters label {
      font-weight: 600;
      margin-right: 5px;
      font-size: 14px;
      color: #333;
    }

    /* Select dropdown and date input styles */
    form.filters select,
    form.filters input[type="date"] {
      padding: 8px 12px;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 14px;
      background-color: #f9f9f9;
      transition: border-color 0.2s;
    }
    form.filters select:focus,
    form.filters input[type="date"]:focus {
      border-color: #ff5733;
      outline: none;
    }

    /* Modal window styles */
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

    /* Modal content styling */
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

     /* Close button for modal */
    .close-btn {
      float: right;
      font-size: 20px;
      cursor: pointer;
      color: red;
    } 

     /* Submit button styling */
    .book-button {
      background-color: #28a745;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 6px;
      font-weight: bold;
      font-size: 16px;
      cursor: pointer;
      width: 100%;
    }
    .book-button:hover {
      background-color: #218838;
    }
    .modal-content h3 {
      font-size: 22px;
      font-family: 'Playfair Display', serif;
    }
    .modal-content p {
      font-size: 15px;
      color: #444;
      margin-bottom: 8px;
    }

    #bookingForm input {
      width: 100%;
      padding: 8px;
      margin-bottom: 10px;
      box-sizing: border-box;
    }
    #bookingSuccess {
      display: none;
      margin-top: 15px;
      color: green;
      font-weight: bold;
    }
     /* Toast notification styling */
    #toast {
      display: none;
      position: fixed;
      bottom: 30px;
      right: 30px;
      background-color: #28a745;
      color: white;
      padding: 15px 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.2);
      font-weight: bold;
      z-index: 9999;
      transition: opacity 0.5s ease;
      opacity: 0;
    }
    #toast.show {
      display: block !important;
      opacity: 1;
    }
  </style>
</head>
<body>

<!-- Header section -->
<header>
  <div class="logo"><a href="index.html"><img src="images/travel.png" alt="TravelWise Logo" class="logo-img"></a></div>
  <nav>
    <ul>
      <li><a href="reviews.html">Reviews</a></li>
      <li><a href="gallery.html">Gallery</a></li>
      <li><a href="faq.html">FAQ</a></li>
    </ul>
  </nav>
</header>
<!-- Main content section -->
<div style="height: 90px;"></div>

<h2>🌟 Results for '<span style="color:#ff5733"><?= htmlspecialchars($city) ?></span>'</h2>

<!-- Filter form for the search functionality -->
<form method="GET" class="filters">
  <div class="filter-row">
    <?php foreach ($filters as $name => $options): ?>
      <label><?= ucfirst(str_replace("_", " ", $name)) ?>:</label>
      <select name="<?= $name ?>" onchange="this.form.submit()">
        <option value="">All</option>
        <?php foreach ($options as $opt): ?>
          <option value="<?= $opt ?>" <?= ($$name == $opt) ? 'selected' : '' ?>><?= htmlspecialchars($opt) ?></option>
        <?php endforeach; ?>
      </select>
    <?php endforeach; ?>
  </div>
  <div class="filter-row">
    <label>From:</label>
    <input type="date" name="start_date" value="<?= htmlspecialchars($start_date) ?>" onchange="this.form.submit()">
    <label>To:</label>
    <input type="date" name="end_date" value="<?= htmlspecialchars($end_date) ?>" onchange="this.form.submit()">
    <label>Prices:</label>
    <select name="price_range" onchange="this.form.submit()">
      <option value="">All</option>
      <option value="under50" <?= ($price_range == 'under50') ? 'selected' : '' ?>>Under $50</option>
      <option value="50to100" <?= ($price_range == '50to100') ? 'selected' : '' ?>>$50–100</option>
      <option value="100plus" <?= ($price_range == '100plus') ? 'selected' : '' ?>>$100+</option>
    </select>
  </div>
</form>

<!-- Displaying activity cards -->
<div class="card-container">
<?php if ($result && $result->num_rows > 0): 
  while($row = $result->fetch_assoc()): 
  $jsonData = htmlspecialchars(json_encode($row), ENT_QUOTES, 'UTF-8');
?>
  <div class="card" data-activity='<?= $jsonData ?>' onclick="handleCardClick(this)">
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

<!-- Modal for booking details -->
<div id="activityModal" class="modal" onclick="closeModal(event)">
  <div class="modal-content" style="display: flex; flex-direction: row; gap: 20px; flex-wrap: wrap;">
    
    <!-- Left: Image and Description -->
    <div style="flex: 1 1 300px;">
      <img id="modalImage" src="" alt="" style="width: 100%; border-radius: 10px; margin-bottom: 15px;">
      <h3 id="modalTitle" style="margin-bottom: 10px;"></h3>
      <p id="modalDesc" style="margin-bottom: 20px;"></p>
      <p><strong>City:</strong> <span id="modalCity"></span></p>
      <p><strong>Price:</strong> $<span id="modalPrice"></span></p>
      <p><strong>Duration:</strong> <span id="modalDuration"></span></p>
      <p><strong>Date:</strong> <span id="modalDate"></span></p>
      <p><strong>Time of Day:</strong> <span id="modalTime"></span></p>
      <p><strong>Activity Type:</strong> <span id="modalType"></span></p>
    </div>

    <!-- Right: Booking Form -->
    <div style="flex: 1 1 300px; background: #f9f9f9; border: 1px solid #ddd; border-radius: 10px; padding: 20px;">
      <h4 style="margin-top: 0;">Book Now</h4>
      <form id="bookingForm" method="POST">
        <input type="hidden" name="activity_id" id="activityIdField">
        <input type="hidden" name="activity_name" id="activityNameField">
        <input type="hidden" name="city" id="activityCityField">
        
        <label style="display:block; margin-top: 10px;">Name:</label>
        <input type="text" name="name" required style="width: 100%; padding: 8px; border-radius: 6px; border: 1px solid #ccc;">

        <label style="display:block; margin-top: 10px;">Email:</label>
        <input type="email" name="email" required style="width: 100%; padding: 8px; border-radius: 6px; border: 1px solid #ccc;">

        <label style="display:block; margin-top: 10px;">Number of Guests:</label>
        <input type="number" name="guests" value="1" min="1" required style="width: 100%; padding: 8px; border-radius: 6px; border: 1px solid #ccc;">

        <button type="submit" name="submit_booking" class="book-button" style="margin-top: 15px;">Submit Booking</button>
      </form>
    </div>
  </div>
</div>


<!-- Toast notification element -->
<div id="toast">🎉 Booking submitted successfully!</div>

<script>
  // Function to handle the card click (modal display)
function handleCardClick(card) {
  const data = JSON.parse(card.getAttribute('data-activity'));
  showModal(data);
}

// Function to display modal with activity data
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
  document.getElementById('activityNameField').value = data.activity_name;
  document.getElementById('activityCityField').value = data.city;
  document.getElementById('bookingForm').reset();
  document.getElementById('activityModal').style.display = 'flex';
}

// Function to close the modal
function closeModal(event) {
  if (event.target.id === 'activityModal') {
    document.getElementById('activityModal').style.display = 'none';
  }
}
</script>

<?php if ($showSuccess): ?>
<script>
  // Show success toast after booking submission
  window.onload = function() {
    const toast = document.getElementById('toast');
    toast.classList.add('show');
    setTimeout(() => {
      toast.classList.remove('show');
      toast.style.display = 'none';
    }, 4000);
  };
</script>
<?php endif; ?>

</body>
</html>

<?php $conn->close(); ?>

