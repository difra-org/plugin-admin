<?php

namespace Controller\Adm\Status;

class Index extends \Difra\Controller\Adm
{
    public function indexAction()
    {
        /** @var \DOMElement $statusNode */
        $statusNode = $this->root->appendChild($this->xml->createElement('status'));

        // stats/difra
        $statusNode->setAttribute('difra', \Difra\Envi\Version::getFrameworkVersion());
        $statusNode->setAttribute('cache', \Difra\Cache::getInstance()->adapter);
        $statusNode->setAttribute('webserver', $_SERVER['SERVER_SOFTWARE']);
        $statusNode->setAttribute('phpversion', phpversion());

        // stats/plugins
        /** @var $pluginsNode \DOMElement */
        $plugins = \Difra\Plugin::getList();
        $enabledPlugins = $disabledPlugins = [];
        foreach ($plugins as $plugin) {
            if ($plugin->isEnabled()) {
                $enabledPlugins[] = $plugin->getName();
            } else {
                $disabledPlugins[] = $plugin->getName();
            }
        }
        $statusNode->setAttribute('enabledPlugins', implode(', ', $enabledPlugins));
        $statusNode->setAttribute('disabledPlugins', implode(', ', $disabledPlugins));

        // stats/extensions
        /** @var $extensionsNode \DOMElement */
        $extensionsNode = $statusNode->appendChild($this->xml->createElement('extensions'));
        $extensions = get_loaded_extensions();
        $extensionsOk = [];
        $extensionsExtra = [];
        $extensionsRequired = [
            'dom',
            'SimpleXML',
            'xsl',
            'zlib',
            'ctype',
            'json',
            'mbstring',
            'Reflection',
            'Phar',
            'imagick'
        ];
        foreach ($extensions as $extension) {
            if (in_array($extension, $extensionsRequired)) {
                $extensionsOk[] = $extension;
                unset($extensionsRequired[array_search($extension, $extensionsRequired)]);
            } else {
                $extensionsExtra[] = $extension;
            }
        }
        natcasesort($extensionsOk);
        natcasesort($extensionsRequired);
        natcasesort($extensionsExtra);
        $extensionsNode->setAttribute('ok', implode(', ', $extensionsOk));
        $extensionsNode->setAttribute('required', implode(', ', $extensionsRequired));
        $extensionsNode->setAttribute('extra', implode(', ', $extensionsExtra));

        /** @var $permNode \DOMElement */
        $permNode = $statusNode->appendChild($statusNode->ownerDocument->createElement('permissions'));
        $dataDir = \Difra\Envi\Roots::getData();
        if (!is_dir($dataDir)) {
            $permNode->setAttribute('data', 'Directory ' . $dataDir . ' does not exist!');
        } elseif (!is_writable($dataDir)) {
            $permNode->setAttribute('data', 'Directory ' . $dataDir . ' is not writeable!');
        }
    }
}
