package Date::Manip::Lang::finnish;
# Copyright (c) 2012-2013 Sullivan Beck. All rights reserved.
# This program is free software; you can redistribute it and/or modify it
# under the same terms as Perl itself.

########################################################################
########################################################################

require 5.010000;

use strict;
use warnings;
use utf8;

our($VERSION);
$VERSION='6.41';


our($Language,@Encodings,$LangName,$YearAdded);
@Encodings = qw(utf-8 iso-8859-1 perl);
$LangName  = "Finnish";
$YearAdded = 2012;

# These strings are raw undecoded UTF-8 octets:
{ no utf8; $Language = {
  ampm => [
    ['AM', 'A.M.', 'aamulla', 'aamupäivällä', 'aamupaivalla'],
    ['PM', 'P.M.', 'illalla', 'iltapäivällä', 'iltapaivalla'],
  ],
  at => ['kello'],
  day_abb => [['ma'], ['ti'], ['ke'], ['to'], ['pe'], ['la'], ['su']],
  day_char => [['ma'], ['ti'], ['ke'], ['to'], ['pe'], ['la'], ['su']],
  day_name => [
    ['maanantai'],
    ['tiistai'],
    ['keskiviikko'],
    ['torstai,'],
    ['perjantai'],
    ['lauantai'],
    ['sunnuntai'],
  ],
  each => ['joka', 'jokainen'],
  fields => [
    ['vuotta', 'vuosi', 'v'],
    ['kuukautta', 'kuukausi', 'kk'],
    ['viikkoa', 'vk', 'viikko'],
    ['paivaa', 'päivää', 'päivä', 'paiva', 'pv'],
    ['tuntia', 'h', 'tunti'],
    ['minuuttia', 'minuutti', 'min'],
    ['sekuntia', 's', 'sekunti'],
  ],
  last => ['viimeinen'],
  mode => [
    ['täsmälleen', 'tasmalleen', 'tasan', 'noin', 'suunnilleen', 'osapuilleen'],
    ['arkipaiva', 'arkipäivä'],
  ],
  month_abb => [
    ['tammi'],
    ['helmi'],
    ['maalis'],
    ['huhti'],
    ['touko'],
    ['kesa', 'kesä'],
    ['heina', 'heinä'],
    ['elo'],
    ['syys'],
    ['loka'],
    ['marras'],
    ['joulu'],
  ],
  month_name => [
    ['tammikuu', 'tammikuun', 'tammikuuta'],
    ['helmikuu', 'helmikuun', 'helmikuuta'],
    ['maaliskuu', 'maaliskuun', 'maaliskuuta'],
    ['huhtikuu', 'huhtikuun', 'huhtikuuta'],
    ['toukokuu', 'toukokuun', 'toukokuuta'],
    ['kesäkuu', 'kesakuu', 'kesakuun', 'kesakuuta'],
    ['heinäkuu', 'heinakuu', 'heinakuun', 'heinakuuta'],
    ['elokuu', 'elokuun', 'elokuuta'],
    ['syyskuu', 'syyskuun', 'syyskuuta'],
    ['lokakuu', 'lokakuun', 'lokakuuta'],
    ['marraskuu', 'marraskuun', 'marraskuuta'],
    ['joulukuu', 'joulukuun', 'joulukuuta'],
  ],
  nextprev => [['ensi'], ['viime']],
  nth => [
    ['1.', 'ensimmäinen', 'ensimmainen', 'yksi'],
    ['2.', 'toinen', 'kaksi'],
    ['3.', 'kolmas', 'kolme'],
    ['4.', 'neljäs', 'neljas', 'neljä', 'nelja'],
    ['5.', 'viides', 'viisi'],
    ['6.', 'kuudes', 'kuusi'],
    ['7.', 'seitsemäs', 'seitsemas', 'seitsemän', 'seitseman'],
    ['8.', 'kahdeksas', 'kahdeksan'],
    ['9.', 'yhdeksäs', 'yhdeksas', 'yhdeksän', 'yhdeksan'],
    ['10.', 'kymmenes', 'kymmenen'],
    ['11.', 'yksitoista', 'yhdestoista'],
    ['12.', 'kaksitoista', 'kahdestoista'],
    ['13.', 'kolmetoista', 'kolmastoista'],
    ['14.', 'neljätoista', 'neljatoista', 'neljästoista', 'neljastoista'],
    ['15.', 'viisitoista', 'viidestoista'],
    ['16.', 'kuusitoista', 'kuudestoista'],
    [
      '17.',
      'seitsemäntoista',
      'seitsemantoista',
      'seitsemästoista',
      'seitsemastoista',
    ],
    ['18.', 'kahdeksantoista', 'kahdeksastoista'],
    [
      '19.',
      'yhdeksäntoista',
      'yhdeksantoista',
      'yhdeksästoista',
      'yhdeksastoista',
    ],
    ['20.', 'kahdeskymmenes', 'kaksikymmentä', 'kaksikymmenta'],
    [
      '21.',
      'kahdeskymmenesensimmäinen',
      'kahdeskymmenesensimmainen',
      'kaksikymmentäyksi',
      'kaksikymmentayksi',
    ],
    ['22.', 'kahdeskymmenestoinen', 'kaksikymmentäkaksi', 'kaksikymmentakaksi'],
    ['23.', 'kahdeskymmeneskolmas', 'kaksikymmentäkolme', 'kaksikymmentakolme'],
    [
      '24.',
      'kahdeskymmenesneljäs',
      'kahdeskymmenesneljas',
      'kaksikymmentäneljä',
      'kaksikymmentanelja',
    ],
    ['25.', 'kahdeskymmenesviides', 'kaksikymmentäviisi', 'kaksikymmentaviisi'],
    ['26.', 'kahdeskymmeneskuudes', 'kaksikymmentäkuusi', 'kaksikymmentakuusi'],
    [
      '27.',
      'kahdeskymmenesseitsemäs',
      'kahdeskymmenesseitsemas',
      'kaksikymmentäseitsemän',
      'kaksikymmentaseitseman',
    ],
    [
      '28.',
      'kahdeskymmeneskahdeksas',
      'kaksikymmentäkahdeksan',
      'kaksikymmentakahdeksan',
    ],
    [
      '29.',
      'kahdeskymmenesyhdeksäs',
      'kahdeskymmenesyhdeksas',
      'kaksikymmentäyhdeksän',
      'kaksikymmentayhdeksan',
    ],
    ['30.', 'kolmaskymmene', 'kolmekymmentä', 'kolmekymmenta'],
    [
      '31.',
      'kolmaskymmenesensimmäinen',
      'kolmaskymmenesensimmainen',
      'kolmekymmentäyksi',
      'kolmekymmentayksi',
    ],
    ['32.', 'kolmaskymmenestoinen', 'kolmekymmentäkaksi', 'kolmekymmentakaksi'],
    ['33.', 'kolmaskymmeneskolmas', 'kolmekymmentäkolme', 'kolmekymmentakolme'],
    [
      '34.',
      'kolmaskymmenesneljäs',
      'kolmaskymmenesneljas',
      'kolmekymmentäneljä',
      'kolmekymmentanelja',
    ],
    ['35.', 'kolmaskymmenesviides', 'kolmekymmentäviisi', 'kolmekymmentaviisi'],
    ['36.', 'kolmaskymmeneskuudes', 'kolmekymmentäkuusi', 'kolmekymmentakuusi'],
    [
      '37.',
      'kolmaskymmenesseitsemäs',
      'kolmaskymmenesseitsemas',
      'kolmekymmentäseitsemän',
      'kolmekymmentaseitseman',
    ],
    [
      '38.',
      'kolmaskymmeneskahdeksas',
      'kolmekymmentäkahdeksan',
      'kolmekymmentakahdeksan',
    ],
    [
      '39.',
      'kolmaskymmenesyhdeksäs',
      'kolmaskymmenesyhdeksas',
      'kolmekymmentäyhdeksän',
      'kolmekymmentayhdeksan',
    ],
    ['40.', 'neljäskymmenes', 'neljaskymmenes', 'neljäkymmentä', 'neljakymmenta'],
    [
      '41.',
      'neljäskymmenesensimmäinen',
      'neljaskymmenesensimmainen',
      'neljäkymmentäyksi',
      'neljakymmentayksi',
    ],
    [
      '42.',
      'neljäskymmenestoinen',
      'neljaskymmenestoinen',
      'neljäkymmentäkaksi',
      'neljakymmentakaksi',
    ],
    [
      '43.',
      'neljäskymmeneskolmas',
      'neljaskymmeneskolmas',
      'neljäkymmentäkolme',
      'neljakymmentakolme',
    ],
    [
      '44.',
      'neljäskymmenesneljäs',
      'neljaskymmenesneljas',
      'neljäkymmentäneljä',
      'neljakymmentänelja',
    ],
    [
      '45.',
      'neljäskymmenesviides',
      'neljaskymmenesviides',
      'neljäkymmentäviisi',
      'neljakymmentaviisi',
    ],
    [
      '46.',
      'neljäskymmeneskuudes',
      'neljaskymmeneskuudes',
      'neljäkymmentäkuusi',
      'neljakymmentakuusi',
    ],
    [
      '47.',
      'neljäskymmenesseitsemäs',
      'neljaskymmenesseitsemas',
      'neljäkymmentäseitsemän',
      'neljakymmentaseitseman',
    ],
    [
      '48.',
      'neljäskymmeneskahdeksas',
      'neljaskymmeneskahdeksas',
      'neljäkymmentäkahdeksan',
      'neljakymmentakahdeksan',
    ],
    [
      '49.',
      'neljäskymmenesyhdeksäs',
      'neljaskymmenesyhdeksas',
      'neljäkymmentäyhdeksän',
      'neljakymmentayhdeksan',
    ],
    ['50.', 'viideskymmenes', 'viisikymmentä', 'viisikymmenta'],
    [
      '51.',
      'viideskymmenesensimmäinen',
      'viideskymmenesensimmainen',
      'viisikymmentäyksi',
      'viisikymmentayksi',
    ],
    ['52.', 'viideskymmenestoinen', 'viisikymmentäkaksi', 'viisikymmentakaksi'],
    ['53.', 'viideskymmeneskolmas', 'viisikymmentäkolme', 'viisikymmentakolme'],
  ],
  of => [''],
  offset_date => {
    'huomenna'       => '+0:0:0:1:0:0:0',
    'tanaan'         => '0:0:0:0:0:0:0',
    'toissapaivana'  => '-0:0:0:2:0:0:0',
    'toissapäivänä'  => '-0:0:0:2:0:0:0',
    'tänään'         => '0:0:0:0:0:0:0',
    'yesterdayeilen' => '-0:0:0:1:0:0:0',
    'ylihuomenna'    => '+0:0:0:2:0:0:0',
  },
  offset_time => { nyt => '0:0:0:0:0:0:0' },
  on => [''],
  sephm => ['[.]'],
  sepms => ['[.]'],
  times => {
    'keskipaiva'    => '12:00:00',
    'keskipaivalla' => '12:00:00',
    'keskipäivä'    => '12:00:00',
    'keskipäivällä' => '12:00:00',
    'keskiyo'       => '00:00:00',
    'keskiyolla'    => '00:00:00',
    'keskiyö'       => '00:00:00',
    'keskiyöllä'    => '00:00:00',
  },
  when => [['sitten'], ['ssa', 'myöhemmin', 'myohemmin']],
}}

1;
