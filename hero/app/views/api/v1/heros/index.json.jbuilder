json.array! @heros.each do |hero|
  json.partial! 'hero.json.jbuilder', hero: hero
end