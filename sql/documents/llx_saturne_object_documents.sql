-- Copyright (C) 2021-2023 EVARISK <technique@evarisk.com>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see https://www.gnu.org/licenses/.

CREATE TABLE llx_saturne_object_documents(
    rowid         integer AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ref           varchar(128) DEFAULT '(PROV)' NOT NULL,
    ref_ext       varchar(128),
    entity        integer DEFAULT 1 NOT NULL,
    date_creation datetime NOT NULL,
    tms           timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    import_key    varchar(14),
    status        integer DEFAULT 1 NOT NULL,
    type          varchar(128),
    module_name   varchar(128),
    json          text,
    model_pdf     varchar(255),
    model_odt     varchar(255),
    last_main_doc varchar(128),
    parent_type   varchar(255),
    parent_id     integer NOT NULL,
    fk_user_creat integer NOT NULL
) ENGINE=innodb;
