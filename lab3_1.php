<?php
header('Content-Type: application/json');
header("Cache-Control: no-cache, must-revalidate");
include ('connect.php');
if(isset($_REQUEST["chief"])) {
    $chief = $_REQUEST["chief"];
    $sqlNumberOfWorkers = "SELECT DISTINCT COUNT(w.id_worker) as Account FROM 
    worker as w INNER JOIN department as d ON w.fid_department = d.id_department 
    WHERE d.chief = :chief GROUP BY d.id_department";
    $stmt1 = $dbh->prepare($sqlNumberOfWorkers);
    $stmt1->execute(array(':chief' => $chief));
    $res1 = $stmt1->fetchAll(PDO::FETCH_OBJ);
    echo json_encode($res1);
    // foreach($res1 as $row) {
    //     // $number = $row[0];
    //     // print "<row><Number>$number</Number></row>";
    //    echo "Число сотрудников отдела руководителя $chief составляет $row[0]";
    // }
}
?>

