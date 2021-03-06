﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TweetSharp;
namespace PuzzleSover
{
    public partial class PuzzleSolver : System.Web.UI.Page
    {
        private static string consumerKey = "CONSUMER_KEY";
        private static string consumerSecret = "CONSUMER_SECRET";
        private static string accessToken = "ACCESS_TOKEN";
        private static string accessTokenSecret = "ACCESS_TOKEN_SECRET";
        public List<PuzzleData> tweetsUserName; 
        public static string authorUrl;
        public static int maxCount;
        protected void Page_Load(object sender, EventArgs e)
        {
            tweetsUserName = new List<PuzzleData>();
            TwitterService service = new TwitterService(consumerKey, consumerSecret);
            service.AuthenticateWith(accessToken, accessTokenSecret);

            var options = new SearchOptions { Q = "Brilliant @fredtrotter post about bitcoin, Wall Street, and cancer http://t.co/q9WZNA0cZR) Must read on \"malignant computation\"!", Count =30 };
            TwitterSearchResult tweets = service.Search(options);

            int i = 0;

            foreach (var tweet in tweets.Statuses)
            {
                authorUrl = tweet.RetweetedStatus.User.ProfileImageUrlHttps;
                if (authorUrl.Contains(".png") || authorUrl.Contains(".jpg") || authorUrl.Contains(".bmp"))
                {
                    authorUrl = authorUrl.Remove(authorUrl.Length - 11, 7);
                }
                else if (authorUrl.Contains(".jpeg"))
                {
                    authorUrl = authorUrl.Remove(authorUrl.Length - 12, 7);
                }
                i += 1;
                if (i > 10) break;

                tweetsUserName.Add(new PuzzleData() { followerCount = tweet.User.FollowersCount, profileImage = tweet.User.ProfileImageUrl, userId = tweet.User.Id });
                
            }
            tweetsUserName = tweetsUserName.OrderByDescending(x => x.followerCount).ToList();
        }
    }

    public class PuzzleData
    {
        public long userId { get; set; }
        public int followerCount { get; set; }
        public string profileImage { get; set; }
    }
}