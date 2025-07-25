---
category: Components
group: General
title: Icon
description: Semantic vector graphics.
showImport: false
cover: https://mdn.alipayobjects.com/huamei_7uahnr/afts/img/A*PdAYS7anRpoAAAAAAAAAAAAADrJ8AQ/original
coverDark: https://mdn.alipayobjects.com/huamei_7uahnr/afts/img/A*xEDOTJx2DEkAAAAAAAAAAAAADrJ8AQ/original
demo:
  cols: 2
---

## How to use

Before using icons, you need to install the [@ant-design/icons](https://github.com/ant-design/ant-design-icons) package:

<InstallDependencies npm='npm install @ant-design/icons@5.x --save' yarn='yarn add @ant-design/icons@5.x' pnpm='pnpm install @ant-design/icons@5.x --save' bun='bun add @ant-design/icons@5.x'></InstallDependencies>

<!-- prettier-ignore -->
:::warning{title=Tips}
Remember to use @ant-design/icons v5 with antd v5. See: [#53275](https://github.com/ant-design/ant-design/issues/53275#issuecomment-2747448317)
:::

## List of icons

<IconSearch></IconSearch>

## Examples

<!-- prettier-ignore -->
<code src="./demo/basic.tsx">Basic</code>
<code src="./demo/two-tone.tsx">Two-tone icon and colorful icon</code>
<code src="./demo/custom.tsx">Custom Icon</code>
<code src="./demo/iconfont.tsx">Use iconfont.cn</code>
<code src="./demo/scriptUrl.tsx">Multiple resources from iconfont.cn</code>

## API

### Common Icon

| Property | Description | Type | Default | Version |
| --- | --- | --- | --- | --- |
| className | The className of Icon | string | - |  |
| rotate | Rotate by n degrees (not working in IE9) | number | - |  |
| spin | Rotate icon with animation | boolean | false |  |
| style | The style properties of icon, like `fontSize` and `color` | CSSProperties | - |  |
| twoToneColor | Only supports the two-tone icon. Specify the primary color | string (hex color) | - |  |

We still have three different themes for icons, icon component name is the icon name suffixed by the theme name.

```jsx
import { StarOutlined, StarFilled, StarTwoTone } from '@ant-design/icons';

<StarOutlined />
<StarFilled />
<StarTwoTone twoToneColor="#eb2f96" />
```

### Custom Icon

| Property | Description | Type | Default | Version |
| --- | --- | --- | --- | --- |
| component | The component used for the root node | ComponentType&lt;CustomIconComponentProps> | - |  |
| rotate | Rotate degrees (not working in IE9) | number | - |  |
| spin | Rotate icon with animation | boolean | false |  |
| style | The style properties of icon, like `fontSize` and `color` | CSSProperties | - |  |

### About SVG icons

We introduced SVG icons in version `3.9.0`, replacing font icons. This has the following benefits:

- Complete offline usage of icons, without dependency on a CDN-hosted font icon file (No more empty square during downloading and no need to deploy icon font files locally either!)
- Much more display accuracy on lower-resolution screens
- The ability to choose icon color
- No need to change built-in icons with overriding styles by providing more props in component

More discussion of SVG icon reference at [#10353](https://github.com/ant-design/ant-design/issues/10353).

> ⚠️ Given the extra bundle size caused by all SVG icons imported in 3.9.0, we will provide a new API to allow developers to import icons as needed, you can track [#12011](https://github.com/ant-design/ant-design/issues/12011) for updates.
>
> While you wait, you can use [webpack plugin](https://github.com/Beven91/webpack-ant-icon-loader) from the community to chunk the icon file.

The properties `theme`, `component` and `twoToneColor` were added in `3.9.0`. The best practice is to pass the property `theme` to every `<Icon />` component.

```jsx
import { MessageOutlined } from '@ant-design/icons';

<MessageOutlined style={{ fontSize: '16px', color: '#08c' }} />;
```

All the icons will render to `<svg>`. You can still set `style` and `className` for size and color of icons.

```jsx
<Icon type="message" style={{ fontSize: '16px', color: '#08c' }} theme="outlined" />
```

### Set TwoTone Color

When using the two-tone icons, you can use the static methods `getTwoToneColor()` and `setTwoToneColor(colorString)` to specify the primary color.

```jsx
import { getTwoToneColor, setTwoToneColor } from '@ant-design/icons';

setTwoToneColor('#eb2f96');
getTwoToneColor(); // #eb2f96
```

### Custom Font Icon

We added a `createFromIconfontCN` function to help developer use their own icons deployed at [iconfont.cn](http://iconfont.cn/) in a convenient way.

> This method is specified for [iconfont.cn](http://iconfont.cn/).

```jsx
import React from 'react';
import { createFromIconfontCN } from '@ant-design/icons';
import ReactDOM from 'react-dom/client';

const MyIcon = createFromIconfontCN({
  scriptUrl: '//at.alicdn.com/t/font_8d5l8fzk5b87iudi.js', // generate in iconfont.cn
});

ReactDOM.createRoot(mountNode).render(<MyIcon type="icon-example" />);
```

It creates a component that uses SVG sprites in essence.

The following options are available:

| Property | Description | Type | Default | Version |
| --- | --- | --- | --- | --- |
| extraCommonProps | Define extra properties to the component | { \[key: string]: any } | {} |  |
| scriptUrl | The URL generated by [iconfont.cn](http://iconfont.cn/) project. Support `string[]` after `@ant-design/icons@4.1.0` | string \| string\[] | - |  |

The property `scriptUrl` should be set to import the SVG sprite symbols.

See [iconfont.cn documents](http://iconfont.cn/help/detail?spm=a313x.7781069.1998910419.15&helptype=code) to learn about how to generate `scriptUrl`.

### Custom SVG Icon

You can import SVG icon as a react component by using `webpack` and [`@svgr/webpack`](https://www.npmjs.com/package/@svgr/webpack). `@svgr/webpack`'s `options` [reference](https://github.com/smooth-code/svgr#options).

```js
// webpack.config.js
module.exports = {
  // ... other config
  test: /\.svg(\?v=\d+\.\d+\.\d+)?$/,
  use: [
    {
      loader: 'babel-loader',
    },
    {
      loader: '@svgr/webpack',
      options: {
        babel: false,
        icon: true,
      },
    },
  ],
};
```

You can import SVG icon as a react component by using `vite` and [`vite-plugin-svgr`](https://www.npmjs.com/package/vite-plugin-svgr). `@svgr/webpack`'s `options` [reference](https://github.com/smooth-code/svgr#options).

```js
// vite.config.js
export default defineConfig(() => ({
  // ... other config
  plugins: [svgr({ svgrOptions: { icon: true } })],
}));
```

```jsx
import React from 'react';
import Icon from '@ant-design/icons';
import MessageSvg from 'path/to/message.svg'; // path to your '*.svg' file.

// import MessageSvg from 'path/to/message.svg?react'; // use vite path to your '*.svg?react' file.
import ReactDOM from 'react-dom/client';

// in create-react-app:
// import { ReactComponent as MessageSvg } from 'path/to/message.svg';

ReactDOM.createRoot(mountNode).render(<Icon component={MessageSvg} />);
```

The following properties are available for the component:

| Property | Description | Type | Readonly | Version |
| --- | --- | --- | --- | --- |
| className | The computed class name of the `svg` element | string | - |  |
| fill | Define the color used to paint the `svg` element | string | `currentColor` |  |
| height | The height of the `svg` element | string \| number | `1em` |  |
| style | The computed style of the `svg` element | CSSProperties | - |  |
| width | The width of the `svg` element | string \| number | `1em` |  |

## Design Token

<ComponentTokenTable component="Icon"></ComponentTokenTable>

## FAQ

### Why does icon style sometimes cause global style error? {#faq-icon-bad-style}

Related issue: [#54391](https://github.com/ant-design/ant-design/issues/54391)

When enable `layer`, icon style may deprioritize `@layer antd` and cause all components to be styled abnormally.

This problem can be resolved by two steps below:

1. use `@ant-design/icons^5` instead of the latest version.
2. stop to use static methods of `message`, `Modal` 和 `notification`. use hooks version or `App` provided instance.

If you must use static methods, you can put any of icon components just under `App`, what helps to avoid style impact caused by static methods.

```diff
<StyleProvider layer>
  <ConfigProvider>
    <App>
+     {/* any icon */}
+     <RightOutlined />
      {/* your pages */}
    </App>
  </ConfigProvider>
</StyleProvider>
```
