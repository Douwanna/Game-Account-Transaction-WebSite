exec dbo.add_Game 3002,N'汉末霸业','img',N'安其拉'
select id from Game where game_name=N'汉末霸业' and platform_id=3002
