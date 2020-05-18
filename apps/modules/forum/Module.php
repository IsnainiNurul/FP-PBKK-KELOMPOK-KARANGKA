<?php

namespace Its\Example\Forum;

use Phalcon\Di\DiInterface;
use Phalcon\Loader;
use Phalcon\Mvc\ModuleDefinitionInterface;

class Module implements ModuleDefinitionInterface
{
    public function registerAutoloaders(DiInterface $di = null)
    {
        $loader = new Loader();

        $loader->registerNamespaces([

            'Its\Example\Forum\Core\Domain\Event' => __DIR__ . '/Core/Domain/Event',
            'Its\Example\Forum\Core\Domain\Model' => __DIR__ . '/Core/Domain/Model',
            'Its\Example\Forum\Core\Domain\Repository' => __DIR__ . '/Core/Domain/Repository',
            'Its\Example\Forum\Core\Domain\Service' => __DIR__ . '/Core/Domain/Service',

            'Its\Example\Forum\Core\Application\Service' => __DIR__ . '/Core/Application/Service',
            'Its\Example\Forum\Core\Application\EventSubscriber' => __DIR__ . '/Core/Application/EventSubscriber',

            'Its\Example\Forum\Infrastructure\Persistence' => __DIR__ . '/Core/Infrastructure/Persistence',

            'Its\Example\Forum\Presentation\Web\Controller' => __DIR__ . '/Presentation/Web/Controller',
            'Its\Example\Forum\Presentation\Web\Models' => __DIR__ . '/Presentation/Web/Models',
            'Its\Example\Forum\Presentation\Web\Form' => __DIR__ . '/Presentation/Web/Form',
            
            'Its\Example\Forum\Presentation\Web\Validator' => __DIR__ . '/Presentation/Web/Validator',
            'Its\Example\Forum\Presentation\Api\Controller' => __DIR__ . '/Presentation/Api/Controller',
            
        ]);

        $loader->register();
    }

    public function registerServices(DiInterface $di = null)
    {
        $moduleConfig = require __DIR__ . '/config/config.php';

        $di->get('config')->merge($moduleConfig);

        include_once __DIR__ . '/config/services.php';
    }
}