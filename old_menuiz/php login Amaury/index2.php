<!-- Rajouter ce code dans le index.php -->
if (isset($_SESSION["name"])) {
echo '<H1 class="form-legend">Bienvenue ' . $_SESSION["name"] . ' !</H1>';
echo '<br /><br /><a href="logout.php">Se déconnecter</a>';
} else {
header("location:pdo_login.php");
}