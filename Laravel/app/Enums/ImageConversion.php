<?php

namespace App\Enums;

use BenSampo\Enum\Enum;

/**
 * @method static static Small()
 * @method static static Medium()
 * @method static static Large()
 * @method static static Default()
 */

final class ImageConversion extends Enum
{
    const Small = "small";
    const Medium = "medium";
    const Large = "large";
    const Default = "default";

    public static $dimensions = [
        self::Small => [100, 100],
        self::Medium => [300, 300],
        self::Large => [500, 500],
        self::Default => [null, null],
    ];

    public static function getDimensions($value) {
        return data_get(self::$dimensions,$value);
    }

    public static function getWidth($value) {
        return data_get(self::$dimensions,$value)[0];
    }

    public static function getHeight($value) {
        return data_get(self::$dimensions,$value)[1];
    }

    public function dimensions() {
        return data_get(self::$dimensions,$this->value);
    }

    public function width() {
        return data_get(self::$dimensions,$this->value)[0];
    }

    public function height() {
        return data_get(self::$dimensions,$this->value)[1];
    }
}
