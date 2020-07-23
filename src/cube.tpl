<div class="wrapper" c-hide={{records.length == 0}}>
   <div id="record-games">
      <ul>
         {{#list records as item by item_index}}
         <li class="record-item">
            <div class="image">
               <a href="{{item.url}}">
                  {{#if item.img}}
                  <img src="{{item.img|clipImage:'70_70_'}}">
                  {{/if}}
               </a>
            </div>
            <div class="content">
               <div class="name">{{item.name}}</div>
               <div class="info">
                  <span class="cate">{{item.type}}</span>
                  <span class="score" style="width: {{score * 9}}px">{{item.score}}</span>
               </div>
               <div class="button-wrap">
                  <a href="{{item.url}}">开始游戏</a>
               </div>
            </div>
         </li>
         {{/list}}
      </ul>
   </div>
   
   <hr class="split">
   <div id="iguess">
      <h5>猜你喜欢：</h5>
      <ul class="game-list">
         {{#list detail.relates as item by item_index}}
         <li class="item">
            <a href="{{item.url}}">
               <img src="{{item.img|clipImage: '48_48_75'}}">
               <span class="text">{{item.name}}</span>
            </a>
         </li>
         {{/list}}
      </ul>
   </div>
</div>
<img src="assets/launchimg.png" c-show={{records.length == 0}} />