<#--
 # This file is part of Fabric-Generator-MCreator.
 # Copyright (C) 2020-2022, Goldorion, opensource contributors
 #
 # Fabric-Generator-MCreator is free software: you can redistribute it and/or modify
 # it under the terms of the GNU Lesser General Public License as published by
 # the Free Software Foundation, either version 3 of the License, or
 # (at your option) any later version.

 # Fabric-Generator-MCreator is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 # GNU Lesser General Public License for more details.
 #
 # You should have received a copy of the GNU Lesser General Public License
 # along with Fabric-Generator-MCreator.  If not, see <https://www.gnu.org/licenses/>.
-->

<#-- @formatter:off -->

/*
 *	MCreator note: This file will be REGENERATED on each build.
 */

package ${package}.init;

public class ${JavaModName}BlockEntities {

	<#list blockentities as blockentity>
	public static BlockEntityType<?> ${blockentity.getModElement().getRegistryNameUpper()};
	</#list>

	public static void load() {
		<#list blockentities as blockentity>
			${blockentity.getModElement().getRegistryNameUpper()} = Registry.register(Registry.BLOCK_ENTITY_TYPE, new ResourceLocation(${JavaModName}.MODID,
				"${blockentity.getModElement().getRegistryName()}"), FabricBlockEntityTypeBuilder.create(${blockentity.getModElement().getName()}BlockEntity::new,
				${JavaModName}Blocks.${blockentity.getModElement().getRegistryNameUpper()}).build(null));
		</#list>
	}

}
<#-- @formatter:on -->