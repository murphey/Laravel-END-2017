<?php
namespace App\MaguttiCms\Website\Repos\Article;
/**
 * Created by PhpStorm.
 * User: Marco Asperti
 * Date: 03/07/2016
 * Time: 10:58
 */
use App\Article;
use App\MaguttiCms\Website\Repos\DbRepository;
class DbArticleRepository extends DbRepository implements ArticleRepositoryInterface
{

    protected $model;
    function  __construct(Article $model)
    {
        $this->model = $model;
    }

    function getParentPage($parent)
    {
      return $this->model->where('slug', $parent)
                         ->where('id_parent',0)
                         ->where('pub', 1)
                         ->first();
    }

    function getSubPage($parent, $child)
    {

      $parent = $this->getBySlug($parent);
      $child  = $this->getBySlug($child);

      // If $parent or $child doesn't exists
      if(!$parent || !$child) {
        return false;
      }

      // If $parent and $child doesn't match
      if($parent->id != $child->id_parent) {
        return false;
      }

      // Return $child data
      return $child;
    }
}
