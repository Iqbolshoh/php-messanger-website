<?php
session_start();

if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header('Location: ./login/');
    exit;
}

include "./config.php";
$db = new Database();

$users = $db->select('users', '*', 'id != ?', [$_SESSION['user']['id']], 'i');

if (isset($_GET['chat']) && is_numeric($_GET['chat'])) {
    $chatId = $_GET['chat'];
    $messages = $db->select('messages', '*', 'sender_id = ? AND receiver_id = ? OR sender_id = ? AND receiver_id = ?', [$chatId, $_SESSION['user']['id'], $_SESSION['user']['id'], $chatId], 'iiii');

    print_r($messages);
} else {
    $messages = null;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./src/css/styles.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <title>Messenger App</title>
</head>

<body>
    <!-- Backdrop for mobile sidebar -->
    <div class="backdrop" id="backdrop" onclick="toggleSidebar()"></div>

    <!-- Users sidebar -->
    <div class="users-sidebar" id="sidebar">
        <div class="header">
            <a href="./">Messenger</a>
            <button class="menu-button" onclick="toggleSidebar()">✕</button>
            <i class="fa-solid fa-right-from-bracket" onclick="logout()"></i>
        </div>
        <div class="search-bar">
            <input type="text" placeholder="Search people...">
        </div>
        <div class="users-list">
            <?php foreach ($users as $user): ?>
                <a class="user" href="?chat=<?= $user['id'] ?>">
                    <div class="user-avatar"><?php echo substr($user['name'], 0, 2); ?></div>
                    <div class="user-info">
                        <div class="user-name"><?php echo $user['name']; ?></div>
                        <div class="user-last-message">Last message here...</div>
                    </div>
                </a>
            <?php endforeach ?>
        </div>
    </div>

    <!-- Chat area -->
    <div class="chat-area">
        <div class="chat-header">
            <button class="menu-button" onclick="toggleSidebar()">☰</button>
            <div class="chat-header-avatar">JD</div>
            <div class="chat-header-info">
                <div class="chat-header-name">John Doe</div>
                <div class="chat-header-status">Online</div>
            </div>
        </div>

        <div class="messages-container">
            <div class="messages-container-inner">
                <!-- Received message -->
                <div class="message received">
                    <div class="message-bubble">Hey there! How are you doing?</div>
                    <div class="message-time">10:30 AM</div>
                </div>

                <!-- Sent message -->
                <div class="message sent">
                    <div class="message-bubble">I'm doing great! Just working on some projects.</div>
                    <div class="message-time">10:32 AM</div>
                </div>

                <!-- Received message -->
                <div class="message received">
                    <div class="message-bubble">That sounds interesting. What kind of projects?</div>
                    <div class="message-time">10:33 AM</div>
                </div>

                <!-- Sent message -->
                <div class="message sent">
                    <div class="message-bubble">I'm building a messenger app with HTML and CSS. It's coming along
                        nicely!</div>
                    <div class="message-time">10:35 AM</div>
                </div>

                <!-- Received message -->
                <div class="message received">
                    <div class="message-bubble">Wow, that's awesome! The design looks really clean and modern.</div>
                    <div class="message-time">10:37 AM</div>
                </div>
            </div>
        </div>

        <div class="message-input-area">
            <input type="text" class="message-input" placeholder="Type a message...">
            <button class="send-button">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
                    stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <line x1="22" y1="2" x2="11" y2="13"></line>
                    <polygon points="22 2 15 22 11 13 2 9 22 2"></polygon>
                </svg>
            </button>
        </div>
    </div>

    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const backdrop = document.getElementById('backdrop');
            sidebar.classList.toggle('active');
            backdrop.classList.toggle('active');
        }

        function logout() {
            Swal.fire({
                title: 'Are you sure?',
                text: "You will be logged out!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, log me out!'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = './logout/';
                }
            });
        }
    </script>
</body>

</html>