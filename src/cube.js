export default {
  data: {
    detail: {
      img: ''
    },
    score: 0,
    records: []
  },
  onReady() {
    /*cube 被添加到页面之后 */
    this.request({
      api: "detail",
      complete: (defaultData, res) => {
        if (!res || res.errno != 0 || res.data.played_games.length === 0) {
          this.failback(defaultData)
          return ;
        }
        let data = res.data;
        if (data.played_games.length < 4) {
          data.played_games = data.played_games.concat(defaultData.played_games);
        }
        this.dataHandle(data)
        this.setStorage({
          key: 'data',
          data: data
        })
      },
      fail: (res) => {
        this.failback(res)
      }
    });
  },
  failback(defaultData) {
    this.getStorage({
      key: 'data',
      success: (res) =>{
        res = res || defaultData
        this.dataHandle(res)
      }
    })
  },
  dataHandle(data) {
    data.relates.splice(5);
    data.played_games.splice(4);
    this.setData({
      detail: data,
      score: this.scoreFormat(data.score),
      records: data.played_games
    })
  },
  scoreFormat(num) {
    let res = num % 2;
    return res === 1 ? res : res - 1;
  }
};
