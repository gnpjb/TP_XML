declare namespace xs = "http://www.w3.org/2001/XMLSchema";
declare function local:getBadges($user as node()) as node()*
{
	for $badge in doc("Badges.xml")/badges/row[./@UserId  = $user/@Id]
	return
		<badge>{data($badge/@Name)}</badge>
};

declare variable $threshold as xs:integer external;  

<result>{

let $list := doc("Users.xml")//users/row[./@Reputation > $threshold]

return
	if(fn:empty($list))
	then
			<error>Users not found</error>
	else 
		for $user in $list
		let $posts := doc("Posts.xml")/posts/row[./@OwnerUserId = $user/@Id]
		let $maxScore := fn:max($posts/row/@Score)
		let $posts := $posts/row[./@Score = $maxScore]
		let $lastDate := fn:max($posts/row/@CreationDate)
		let $topPost := $posts/row[(./@Score = $maxScore) and (./@CreationDate = $lastDate)]
		order by $user/@Reputation descending
		return
			<user>
				<name>{data($user/@DisplayName)}</name>
				<description>{data($user/@AboutMe)}</description>
				<location>{data($user/@Location)}</location>
				<reputation>{data($user/@Reputation)}</reputation>
				<upvotes>{data($user/@UpVotes)}</upvotes>
				<downvotes>{data($user/@DownVotes)}</downvotes>
				<badges>{local:getBadges($user)}</badges>
				<top_post>{data($topPost/@Body)}</top_post>
			</user>
}</result>
		
	
