<?php

namespace Model;

use Util\Connection;

class UserRepository
{

    public static function userAuthentication(string $username, string $password):array|null{
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM utente WHERE nome=:username';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'username' => $username
            ]
        );
        //Non esiste un utente con quello username nel database
        if($stmt->rowCount() == 0)
            return null;
        //Recupera i dati dell'utente
        $row = $stmt->fetch();
        //Verifica che la password corrisponda
        //Se non corrisponde ritorna null
        if (!password_verify($password, $row['password']))
            return null;
        //Altrimenti ritorna il vettore contenente i dati dell'utente

        return $row;
    }
    public static function userAuthenticationMail(string $email, string $password):array|null{
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM utente WHERE email=:email';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'email' => $email
            ]
        );
        //Non esiste un utente con quello username nel database
        if($stmt->rowCount() == 0)
            return null;
        //Recupera i dati dell'utente
        $row = $stmt->fetch();
        //Verifica che la password corrisponda
        //Se non corrisponde ritorna null
        if (!password_verify($password, $row['password']))
            return null;
        //Altrimenti ritorna il vettore contenente i dati dell'utente

        return $row;
    }
    public static function checkUser($user, $template){
        $pdo = Connection::getInstance();
        $sql = 'SELECT utente.nome FROM risposta 
         INNER JOIN utente ON risposta.utente_fk = :id
         WHERE utente_fk=utente.id;';
        $stmt = $pdo->prepare($sql);
        $stmt ->execute([
           'id' => $user['id']
        ]);
        $row = $stmt->fetch();
        if($row) {

            echo $template->render('home', [
                'displayed_name' => $row['nome']
            ]);

        }
        else {
            $sql = 'SELECT * FROM domanda 
         WHERE domanda.questionario_fk=1;';
            $stmt = $pdo->query($sql);
            $domande = $stmt->fetchAll();
            echo $template->render('survey', [
                'displayed_name' => $user['nome'],
                'domande' => $domande
            ]);
        }
        return $row;
    }

    public static function retrieveAnswers($user){
        $pdo = Connection::getInstance();
        for ($i = 1; $i <= 10; $i++) {
        $answer = $_POST[''.$i];
            if (is_int($answer)) {
                $sql = 'INSERT INTO risposta (ris_int, utente_fk, domanda_fk)
        VALUES (:ris, :user,:domanda)';
            }
            else {
                $sql = 'INSERT INTO risposta (ris_text, utente_fk, domanda_fk)
        VALUES (:ris, :user,:domanda)';
            }
            $stmt = $pdo->prepare($sql);
            $stmt ->execute([
               'ris' => $answer,
               'user' => $user['id'],
               'domanda' => $i
            ]);
        }
    }
}