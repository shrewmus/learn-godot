using Godot;
using System;
// This class is the same as gd script just to look the same in c#
public partial class GunController : Node
{
	[Export] private PackedScene StartingWeapon;
	private Marker3D hand;
	private Node equippedWeapon;

	public override void _Ready()
	{
		hand = GetParent().FindChild("Hand", true) as Marker3D;
		if (StartingWeapon != null)
		{
			EquipWeapon(StartingWeapon.Instantiate());
		}
	}

	private void EquipWeapon(Node weaponToEquip)
	{
		if (null != equippedWeapon)
		{
			GD.Print("Deleting equipped weapon");
			equippedWeapon.QueueFree();
		}
		else
		{
			GD.Print("No equipped weapon");
			equippedWeapon = weaponToEquip;
			hand.AddChild(equippedWeapon);
		}
	}
}
