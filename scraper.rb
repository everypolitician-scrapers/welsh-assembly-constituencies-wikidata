#!/bin/env ruby
# frozen_string_literal: true

require 'pry'
require 'scraperwiki'
require 'wikidata/area'
require 'wikidata/fetcher'

query = 'SELECT DISTINCT ?item WHERE { ?item wdt:P31 wd:Q44710774 }'
wanted = EveryPolitician::Wikidata.sparql(query)
raise 'No ids' if wanted.empty?

data = Wikidata::Areas.new(ids: wanted).data
ScraperWiki.save_sqlite(%i[id], data)
