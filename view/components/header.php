<?php
session_start();
include('backend/class.php');

$db = new global_class();

$maintenance = $db->fetch_maintenance();

if (isset($_SESSION['id'])) {
    $id = intval($_SESSION['id']);

   
    $On_Session = $db->check_account($id);

//    echo "<pre>";
//    print_r($On_Session);
//    echo "</pre>";
 
 
  
    // if (!empty($On_Session)) {
    //     if($_SESSION['role']!="Administrator"){
    //       header('location: ../home');
    //     }
    // } else {
    //    header('location: ../');
    // }
} else {
   header('location: ../');
}
?>




<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><?=$maintenance['system_name']?></title>
  <link rel="icon" type="image/png" href="../assets/logo/<?=$maintenance['system_image']?>">
  
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/AlertifyJS/1.13.1/css/alertify.css" integrity="sha512-MpdEaY2YQ3EokN6lCD6bnWMl5Gwk7RjBbpKLovlrH6X+DRokrPRAF3zQJl1hZUiLXfo2e9MrOt+udOnHCAmi5w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/AlertifyJS/1.13.1/alertify.min.js" integrity="sha512-JnjG+Wt53GspUQXQhc+c4j8SBERsgJAoHeehagKHlxQN+MtCCmFDghX9/AcbkkNRZptyZU4zC8utK59M5L45Iw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

 

  <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

</head>
<body class="bg-gray-100 font-sans antialiased ">



<?php include "../function/PageSpinner.php"; ?>


<input hidden type="text" id="user_type" value="<?=$On_Session[0]['role']?>">
<input hidden type="text" id="session_user_id" value="<?=$On_Session[0]['id']?>">


  <div class="min-h-screen flex flex-col lg:flex-row">
    
  <aside id="sidebar" class="bg-gradient-to-br from-red-900 to-red-700 shadow-lg w-64 lg:w-1/5 xl:w-1/6 p-6 space-y-6 lg:static fixed inset-y-0 left-0 z-50 transform -translate-x-full lg:translate-x-0 transition-transform duration-300 ease-in-out">

<!-- Hide Sidebar Button -->
<div class="flex items-center space-x-4 p-4 bg-gradient-to-br from-red-900 to-red-700 rounded-lg shadow-lg hover:shadow-xl transition-shadow duration-300 max-w-full">
  <img src="../assets/logo/<?=$maintenance['system_image']?>" alt="Logo" class="w-20 h-20 rounded-full border-2 border-gray-300 shadow-sm transform transition-transform duration-300 hover:scale-105">
  <h1 class="text-xl font-bold text-white tracking-tight text-left truncate lg:text-left hover:text-yellow-300 transition-colors duration-300 max-w-[70%]">
    <?= ucfirst($On_Session[0]['role']) ?>
  </h1>
</div>


<nav class="space-y-4 text-left lg:text-left">
   
<?php if($_SESSION['role']=="Administrator" || $_SESSION['role']=="Office Heads"){ ?>


    <a href="dashboard" class="flex items-center lg:justify-start space-x-3 text-gray-200 hover:text-yellow-300 hover:bg-gray-800 px-4 py-2 rounded-md transition-all duration-300">
        <span class="material-icons">dashboard</span>
        <span>Dashboard</span>
    </a>

    <a href="users" class="flex items-center lg:justify-start space-x-3 text-gray-200 hover:text-yellow-300 hover:bg-gray-800 px-4 py-2 rounded-md transition-all duration-300">
        <span class="material-icons">manage_accounts</span>
        <span>User Management</span>
    </a>
<?php } ?>   

    <a href="requestManagement" class="flex items-center lg:justify-start space-x-3 text-gray-200 hover:text-yellow-300 hover:bg-gray-800 px-4 py-2 rounded-md transition-all duration-300">
        <span class="material-icons">shopping_cart</span>
        <span>Procurements</span>
        <?php if($_SESSION['role']=="Administrator" || $_SESSION['role']=="Office Heads"){ ?>
        <span id="PendingCounts" class="bg-red-500 text-white text-xs font-semibold rounded-full w-5 h-5 flex items-center justify-center ">
            0
        </span>
        <?php } ?>   
    </a>


<?php if($_SESSION['role']=="Administrator" || $_SESSION['role']=="Office Heads"){ ?>


    
    <button id="toggleAssets" class="w-full flex items-center justify-between text-gray-200 hover:text-yellow-300 hover:bg-gray-800 px-4 py-2 rounded-md transition-all duration-300">
        <div class="flex items-center space-x-3">
            <span class="material-icons">work</span>
            <span>Assets</span>
        </div>
        <span class="material-icons">expand_more</span>
    </button>
    <div id="assetsDropdown" class="ml-8 space-y-2 hidden">
        <a href="receive_logs" class="block text-gray-200 hover:text-yellow-300 hover:bg-gray-800 px-4 py-2 rounded-md transition-all duration-300">➤ Receive Logs</a>
        <a href="manage_assets" class="block text-gray-200 hover:text-yellow-300 hover:bg-gray-800 px-4 py-2 rounded-md transition-all duration-300">➤ Assets</a>
        <a href="inventory" class="block text-gray-200 hover:text-yellow-300 hover:bg-gray-800 px-4 py-2 rounded-md transition-all duration-300">➤ Inventory</a>
    </div>

    <a href="maintinance" class="flex items-center lg:justify-start space-x-3 text-gray-200 hover:text-yellow-300 hover:bg-gray-800 px-4 py-2 rounded-md transition-all duration-300">
        <span class="material-icons">construction</span>
        <span>System Maintenance</span>
        <?php if($_SESSION['role']=="Administrator" || $_SESSION['role']=="Office Heads"){ ?>
        <span id="UnderMaintenanceCounts" class="bg-red-500 text-white text-xs font-semibold rounded-full w-5 h-5 flex items-center justify-center ">
            0
        </span>
        <?php } ?>  
    </a>


    <a href="reports" class="flex items-center lg:justify-start space-x-3 text-gray-200 hover:text-yellow-300 hover:bg-gray-800 px-4 py-2 rounded-md transition-all duration-300">
        <span class="material-icons">bar_chart</span>
        <span>Report Generation</span>
    </a>

<?php } ?> 

    <a href="settings" class="flex items-center lg:justify-start space-x-3 text-gray-200 hover:text-yellow-300 hover:bg-gray-800 px-4 py-2 rounded-md transition-all duration-300">
        <span class="material-icons">settings</span>
        <span>Account Settings</span>
    </a>

  
        <button class="btnLogout flex items-center lg:justify-start space-x-3 text-gray-200 hover:text-red-500 hover:bg-gray-800 px-4 py-2 rounded-md transition-all duration-300">
            <span class="material-icons">logout</span>
            <span>Logout</span>
        </button>
  
</nav>
</aside>





    <!-- Overlay for Mobile Sidebar -->
    <div id="overlay" class="fixed inset-0 bg-black opacity-50 hidden lg:hidden z-40"></div>

    <!-- Main Content -->
    <main class="flex-1 bg-gray-50 p-8 lg:p-12">
      <!-- Mobile menu button -->
      <button id="menuButton" class="lg:hidden text-gray-700 mb-4">
        <span class="material-icons">menu</span> 
      </button>

   

     