names = %W(Toro Jiro Hana Jhon MIke Bill Sophy Alex Mary Tom)
fnames = ["佐藤","鈴木","高橋","田中"]
gnames = ["太郎","二郎","花子"]

0.upto(9) do |idx|
  Member.create(
    number: idx + idx,
    name: names[idx],
    full_name: "#{fnames[idx % 4]} #{gnames[idx % 3]}",
    email: "#{names[idx]}@example.com",
    birthday:"1994-06-25",
    sex: [1,1,2][idx % 3],
    administrator: (idx == 0)
    )
end