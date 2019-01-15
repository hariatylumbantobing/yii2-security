<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "book".
 *
 * @property string $id ID
 * @property string $author_id Author ID
 * @property string $publisher_id Publisher ID
 * @property string $isbn ISBN
 * @property string $title Title
 * @property double $price Price
 * @property string $year Year
 * @property string $description Description
 */
class Book extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'book';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['author_id', 'publisher_id'], 'integer'],
            [['price'], 'number'],
            [['description'], 'string'],
            [['isbn'], 'string', 'max' => 16],
            [['title'], 'string', 'max' => 64],
            [['year'], 'string', 'max' => 4],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'author_id' => 'Author ID',
            'publisher_id' => 'Publisher ID',
            'isbn' => 'Isbn',
            'title' => 'Title',
            'price' => 'Price',
            'year' => 'Year',
            'description' => 'Description',
        ];
    }
}
