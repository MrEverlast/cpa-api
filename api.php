<?php 
  require_once "Database.php";
  if (isset($_GET['query'])) $query = $_GET['query']; else $query = false;
  if (isset($_GET['id'])) $id = $_GET['id'];

  if ($query) {
    switch ($query) {
      case 'get_concurrent':
        $json = getConcurrent($id);
        print_r($json);
        break;
      
      case 'get_file':
        getFile($id);
        break;
      
      default:
        echo false;
        break;
    }
  }

  function getFile($id) {
    $bdd = new Database();
    $req = $bdd->getUserParcoursById($id);
    $data = $req->fetchAll(PDO::FETCH_ASSOC);

    echo '{';
    $i = 0;
    $dataLength = count($data);
    while($i < $dataLength) {
      echo '"waypoint'. $i .'": ';
      print_r(json_encode($data[$i]));
      if ($i < $dataLength - 1)
        echo ",";
      $i++;
    }
    echo '}';
  }

  function getConcurrent($id) {
    $bdd = new Database();
    $req = $bdd->getUserById($id);
    $res = $req->fetch(PDO::FETCH_ASSOC);
    $json = json_encode($res);
    return $json != "" ? $json : "false";
  }


?>