// Copyright 2020-2024 Trust Computing GmbH.
// This file is part of Litentry.
//
// Litentry is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Litentry is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Litentry.  If not, see <https://www.gnu.org/licenses/>.

// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.8;

import {DynamicAssertion, Identity} from "./DynamicAssertion.sol";

contract MyAssertion is DynamicAssertion {
    function execute(Identity[] memory identities, string[] memory secrets)
    public
    override
    returns (
        string memory,
        string memory,
        string[] memory,
        string memory,
        bool
    )
    {
        string
        memory description = "This is my first assertion";
        string memory assertion_type = "Dynamic Assertion Verification";
        assertions.push(
            '{"and": [{ "src": "$works", "op": "==", "dst": "true" }, { "src": "$first_assertion", "op": "==", "dst": "true" } ] }'
        );
        schema_url = "https://raw.githubusercontent.com/litentry/vc-jsonschema/main/dist/schemas/1-my-assertion/1-0-0.json";

        bool result = true;

        return (description, assertion_type, assertions, schema_url, result);
    }
}
