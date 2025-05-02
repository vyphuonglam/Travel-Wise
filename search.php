<?php
$city = $_GET['city'];

$conn = new mysqli("localhost", "root", "", "travel_site");

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT activity_name, description, image_url FROM activities WHERE city LIKE ?";
$stmt = $conn->prepare($sql);
$search = "%" . $city . "%";
$stmt->bind_param("s", $search);
$stmt->execute();
$result = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Search Results</title>
  <link rel="stylesheet" href="Homestyle.css" />
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 40px;
      background-color: #f8f9fa;
    }

    h2 {
      color: #333;
      margin-bottom: 20px;
    }

    .results-container {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 20px;
    }

    .result-card {
      background: white;
      border-radius: 12px;
      padding: 20px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      transition: transform 0.2s ease;
    }

    .result-card:hover {
      transform: scale(1.02);
    }

    .result-card img {
      width: 100%;
      height: 160px;
      object-fit: cover;
      border-radius: 10px;
      margin-bottom: 12px;
    }

    .result-card h3 {
      margin-top: 0;
      color: #2a2a2a;
    }

    .back-button {
      display: inline-block;
      margin-top: 30px;
      padding: 10px 20px;
      background-color: #007BFF;
      color: white;
      border-radius: 8px;
      text-decoration: none;
      transition: background-color 0.2s;
    }

    .back-button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
  <h2>Results for "<?php echo htmlspecialchars($city); ?>"</h2>

  <div class="results-container">
    <?php
    if ($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()) {
        echo "<div class='result-card'>";
        if (!empty($row["image_url"])) {
          echo "<img src='" . htmlspecialchars($row["image_url"]) . "' alt='" . htmlspecialchars($row["activity_name"]) . "'>";
        }
        echo "<h3>" . htmlspecialchars($row["activity_name"]) . "</h3>";
        echo "<p>" . htmlspecialchars($row["description"]) . "</p>";
        echo "</div>";
      }
    } else {
      echo "<p>No results found.</p>";
    }
    ?>
  </div>

  <a class="back-button" href="Home.html">← Back to Home</a>
</body>
</html>
