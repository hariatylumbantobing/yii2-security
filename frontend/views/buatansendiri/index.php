<?php
    /*use yii\helpers\html untuk mengakses native html*/
    use yii\helpers\Html;
    /*$this->title adalah variabel native Yii Framework, anda tidak bebas mengakses variabel buatan sendiri, kecuali merupakan native Yii2 */
    $this->title = 'View dan Controller diciptakan secara manual';
    ?>
        <div class="site-index">
            <h1>Level I<br><br>Kalau anda melihat ini, Selamat anda berhasil membuat controller dan view sendiri</h1>
        </div>
        <p>
            /*Bagian ini -> Html:: , hanya dapat diakses ketika anda menggunakan yii\helperss\html<br>
            /*Perhatikan kata ‘page-baru’, itu merupakan kelas controller Jika anda menjalankan ini pasti akan menuju bagian yang tidak ada.*/<br>

            <?= Html::a('Menuju Level II', ['page-baru'], ['class' => 'btn btnsuccess']) ?>
        </p>
        <p>
            /*Perhatikan kata ‘page-form, itu merupakan kelas controller Jika anda menjalankan ini pasti akan menuju bagian yang tidak ada, karena memang belum dibuat.*/
            <?= Html::a('Menuju Form', ['page-form'], ['class' => '']) ?>
        </p>