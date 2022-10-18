<#--
 # This file is part of Fabric-Generator-MCreator.
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2021, Pylo, opensource contributors
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
<#include "triggers.java.ftl">

package ${package}.item;

import net.minecraft.network.chat.Component;

public class ${name}Item extends RecordItem {

	public ${name}Item() {
		<#if data.music.getUnmappedValue().startsWith("CUSTOM:")>
		super(0, ${JavaModName}Sounds.${data.music?replace(modid + ":", "")?upper_case},
				new Item.Properties().tab(${data.creativeTab}).stacksTo(1).rarity(Rarity.RARE));
		<#else>
		super(0, new SoundEvent(new ResourceLocation("${data.music}")),
				new Item.Properties().tab(${data.creativeTab}).stacksTo(1).rarity(Rarity.RARE));
		</#if>
	}

	<#if data.hasGlow>
      public boolean isFoil(ItemStack itemstack) {
		return true;
	}
	</#if>

	<#if data.specialInfo?has_content>
	@Override public void appendHoverText(ItemStack itemstack, Level world, List<Component> list, TooltipFlag flag) {
		super.appendHoverText(itemstack, world, list, flag);
		<#list data.specialInfo as entry>
		list.add(new TextComponent("${JavaConventions.escapeStringForJava(entry)}"));
		</#list>
	}
	</#if>

	<@onRightClickedInAir data.onRightClickedInAir/>

	<@onItemUsedOnBlock data.onRightClickedOnBlock/>

	<@onEntityHitWith data.onEntityHitWith/>

	<@onCrafted data.onCrafted/>

	<@onStoppedUsing data.onStoppedUsing/>

	<@onItemTick data.onItemInUseTick, data.onItemInInventoryTick/>
}
<#-- @formatter:on -->