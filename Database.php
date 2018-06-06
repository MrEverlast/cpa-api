<?php
  class Database {
    private $BDD;
    private $Host;
    private $User;
    private $Password;
    private $Database;

    function __construct() {
      $dirPath = explode('\\',__FILE__);
      array_pop($dirPath);
      $dirPath = implode('/', $dirPath);
      
      $path = $dirPath . "/cfg/cfg.json";
      $str = file_get_contents($path);
      $json = json_decode($str, true);
      
      $this->Host = $json["Host"];
      $this->User = $json["User"];
      $this->Password = $json["Password"];
      $this->Database = $json["Database"];

      $this->BDD = new PDO("mysql:dbname=$this->Database;host=$this->Host", $this->User, $this->Password);
    }

    public function getUserParcoursById($id) {
      $i = 0;
      $req = $this->BDD->prepare("SELECT B.`Descriptif_Parcours`
                                  FROM `concurrent` AS A
                                  INNER JOIN `parcours` AS B ON A.`idEpreuve` = B.`id`
                                  WHERE A.`NumeroParticipant` = '$id'");

      $req->execute();
      $array = $req->fetch(PDO::FETCH_NUM)[0];
      $point = explode(",", $array);

      foreach ($point as $key => $value) {
  			$req = $this->BDD->prepare("SELECT *
                                    FROM `pointparcours`
                                    WHERE `id` = $value");

  			$req->execute();

        $res = $req->fetch(PDO::FETCH_ASSOC);
        $result[$i] = $res;
        $i++;
      }

      return $result;

    }

    public function getUserById($id) {
      $req = $this->BDD->prepare("SELECT A.`NumeroParticipant`, B.`Nom`, B.`Prenom`, B.`Mail` 
                                  FROM `concurrent` AS A
                                  INNER JOIN `user` AS B ON A.`idUser` = B.`id`
                                  WHERE A.`NumeroParticipant` = $id");
      $req->execute();
      return $req;
    }

  }
  
?>