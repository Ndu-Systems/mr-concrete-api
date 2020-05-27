<?php
include_once 'Users.php';

class Account
{

    private $conn;
    public function __construct($db)
    {
        $this->conn = $db;
    }
    // Activates the users new account
    public function ActivateUserAccount($Token)
    {
        $user  = new Users($this->conn);   

        if ($user->getUserByToken($Token) > 0) {
            $result =  $user->getUserByToken($Token);
            $query = "UPDATE user SET StatusId = ? where Email = ?";
            // do the magic
            try {
                $stmt = $this->conn->prepare($query);
                if ($stmt->execute(array(
                    1,
                    $result["Email"]
                 ))) {
                    return 1;
                } else {
                    return "server error, contact system admin.";
                }
            } catch (Exception $e) {
                return array("ERROR", $e);
            }
        } else {
            return "the entered username/email is invalid";
        }
    }

    // Generates a token and returns our user info
    public function GenerateToken($Email)
    {
        $user  = new Users($this->conn);
        if ($user->getUserByEmail($Email) > 0) {
            $token = bin2hex(openssl_random_pseudo_bytes(16));
            $query = "UPDATE user SET Token = ? where Email = ?";
            // do the magic
            try {
                $stmt = $this->conn->prepare($query);
                if ($stmt->execute(array(
                    $token,
                    $Email
                ))) {
                    $result =  $user->getUserByEmail($Email);
                    $result["Password"] = null;
                    return $result;
                } else {
                    return "server error, contact system admin.";
                }
            } catch (Exception $e) {
                return array("ERROR", $e);
            }
        } else {
            return "the entered username/email is invalid";
        }
    }

    // updates the users password
    public function UpdatePassword($Email, $Password)
    {
        $user  = new Users($this->conn);
        if ($user->getUserByEmail($Email) > 0) {
            $query = "UPDATE user SET Password = ?, Token = ?  where Email = ?";
            try {
                $stmt = $this->conn->prepare($query);
                if ($stmt->execute(array(
                    $Password,
                    null,
                    $Email
                ))) {
                    return 1;
                } else {
                    return "server error, contact system admin.";
                }
            } catch (Exception $e) {
                return array("ERROR", $e);
            }
        } else {
            return "invalid request";
        }
    }
}
