<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Index</title>
    <link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <?php
        use yii\helpers\Html;
        $this->title = 'View dan Controller diciptakan secara manual';
    ?>
        <div class="site-index">
            <h1>Level II<br><br>Kalau anda melihat ini, Selamat anda berhasil membuat Page Level 2 pada controller 'Buatansendiri'</h1>
        </div>
    <p>
        /*Anda perhatikan bahwa, kata 'Index' - mengacu pada class url actionIndex() di controllerBuatansendiri*/
        <?= Html::a('Kembali Ke Level 1', ['index'], ['class' => 'btn btnsuccess']) ?>
    </p>
</body>
</html>