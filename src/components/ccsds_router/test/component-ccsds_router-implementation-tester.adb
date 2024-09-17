--------------------------------------------------------------------------------
-- Ccsds_Router Component Tester Body
--------------------------------------------------------------------------------

with String_Util;

package body Component.Ccsds_Router.Implementation.Tester is

   ---------------------------------------
   -- Initialize heap variables:
   ---------------------------------------
   procedure Init_Base (Self : in out Instance; Queue_Size : in Natural; Ccsds_Space_Packet_T_Send_Count : in Connector_Count_Type) is
   begin
      -- Initialize component heap:
      Self.Component_Instance.Init_Base (Queue_Size => Queue_Size, Ccsds_Space_Packet_T_Send_Count => Ccsds_Space_Packet_T_Send_Count);

      -- Initialize tester heap:
      -- Connector histories:
      Self.Ccsds_Space_Packet_T_Recv_Sync_History.Init (Depth => 20);
      Self.Unrecognized_Ccsds_Space_Packet_T_Recv_Sync_History.Init (Depth => 20);
      Self.Event_T_Recv_Sync_History.Init (Depth => 20);
      Self.Packet_T_Recv_Sync_History.Init (Depth => 20);
      Self.Sys_Time_T_Return_History.Init (Depth => 20);
      -- Initializing extra histories:
      Self.Ccsds_Space_Packet_T_Recv_Sync_1_History.Init (Depth => 20);
      Self.Ccsds_Space_Packet_T_Recv_Sync_2_History.Init (Depth => 20);
      Self.Ccsds_Space_Packet_T_Recv_Sync_3_History.Init (Depth => 20);
      Self.Ccsds_Space_Packet_T_Recv_Sync_4_History.Init (Depth => 20);
      Self.Ccsds_Space_Packet_T_Recv_Sync_5_History.Init (Depth => 20);
      Self.Ccsds_Space_Packet_T_Recv_Sync_6_History.Init (Depth => 20);
      -- Event histories:
      Self.Unrecognized_Apid_History.Init (Depth => 20);
      Self.Dropped_Packet_History.Init (Depth => 20);
      Self.Unexpected_Sequence_Count_Received_History.Init (Depth => 20);
      Self.Dropped_Duplicate_Packet_History.Init (Depth => 20);
      -- Packet histories:
      Self.Error_Packet_History.Init (Depth => 20);
   end Init_Base;

   procedure Final_Base (Self : in out Instance) is
   begin
      -- Destroy tester heap:
      -- Connector histories:
      Self.Ccsds_Space_Packet_T_Recv_Sync_History.Destroy;
      Self.Unrecognized_Ccsds_Space_Packet_T_Recv_Sync_History.Destroy;
      Self.Event_T_Recv_Sync_History.Destroy;
      Self.Packet_T_Recv_Sync_History.Destroy;
      Self.Sys_Time_T_Return_History.Destroy;
      -- Destroying extra histories:
      Self.Ccsds_Space_Packet_T_Recv_Sync_1_History.Destroy;
      Self.Ccsds_Space_Packet_T_Recv_Sync_2_History.Destroy;
      Self.Ccsds_Space_Packet_T_Recv_Sync_3_History.Destroy;
      Self.Ccsds_Space_Packet_T_Recv_Sync_4_History.Destroy;
      Self.Ccsds_Space_Packet_T_Recv_Sync_5_History.Destroy;
      Self.Ccsds_Space_Packet_T_Recv_Sync_6_History.Destroy;
      -- Event histories:
      Self.Unrecognized_Apid_History.Destroy;
      Self.Dropped_Packet_History.Destroy;
      Self.Unexpected_Sequence_Count_Received_History.Destroy;
      Self.Dropped_Duplicate_Packet_History.Destroy;
      -- Packet histories:
      Self.Error_Packet_History.Destroy;

      -- Destroy component heap:
      Self.Component_Instance.Final_Base;
   end Final_Base;

   ---------------------------------------
   -- Test initialization functions:
   ---------------------------------------
   procedure Connect (Self : in out Instance) is
   begin
      -- Not using these autogenerated connections, see below:
      -- self.component_Instance.attach_Ccsds_Space_Packet_T_Send(1, self'Unchecked_Access, self.Ccsds_Space_Packet_T_Recv_Sync_Access);
      -- self.component_Instance.attach_Ccsds_Space_Packet_T_Send(2, self'Unchecked_Access, self.Ccsds_Space_Packet_T_Recv_Sync_Access);
      -- self.component_Instance.attach_Ccsds_Space_Packet_T_Send(3, self'Unchecked_Access, self.Ccsds_Space_Packet_T_Recv_Sync_Access);
      -- self.component_Instance.attach_Unrecognized_Ccsds_Space_Packet_T_Send(self'Unchecked_Access, self.Unrecognized_Ccsds_Space_Packet_T_Recv_Sync_Access);
      Self.Component_Instance.Attach_Event_T_Send (Self'Unchecked_Access, Self.Event_T_Recv_Sync_Access);
      Self.Component_Instance.Attach_Packet_T_Send (Self'Unchecked_Access, Self.Packet_T_Recv_Sync_Access);
      Self.Component_Instance.Attach_Sys_Time_T_Get (Self'Unchecked_Access, Self.Sys_Time_T_Return_Access);
      Self.Attach_Ccsds_Space_Packet_T_Send (Self.Component_Instance'Unchecked_Access, Self.Component_Instance.Ccsds_Space_Packet_T_Recv_Sync_Access);
      Self.Attach_Ccsds_Space_Packet_T_Send_2 (Self.Component_Instance'Unchecked_Access, Self.Component_Instance.Ccsds_Space_Packet_T_Recv_Async_Access);
      -- Making additional custom connections:
      Self.Component_Instance.Attach_Ccsds_Space_Packet_T_Send (1, Self'Unchecked_Access, Ccsds_Space_Packet_T_Recv_Sync_1'Access);
      Self.Component_Instance.Attach_Ccsds_Space_Packet_T_Send (2, Self'Unchecked_Access, Ccsds_Space_Packet_T_Recv_Sync_2'Access);
      Self.Component_Instance.Attach_Ccsds_Space_Packet_T_Send (3, Self'Unchecked_Access, Ccsds_Space_Packet_T_Recv_Sync_3'Access);
      Self.Component_Instance.Attach_Ccsds_Space_Packet_T_Send (4, Self'Unchecked_Access, Ccsds_Space_Packet_T_Recv_Sync_4'Access);
      Self.Component_Instance.Attach_Ccsds_Space_Packet_T_Send (5, Self'Unchecked_Access, Ccsds_Space_Packet_T_Recv_Sync_5'Access);
      Self.Component_Instance.Attach_Ccsds_Space_Packet_T_Send (6, Self'Unchecked_Access, Ccsds_Space_Packet_T_Recv_Sync_6'Access);
   end Connect;

   ---------------------------------------
   -- Invokee connector primitives:
   ---------------------------------------
   -- The ccsds packet send connector.
   overriding procedure Ccsds_Space_Packet_T_Recv_Sync (Self : in out Instance; Arg : in Ccsds_Space_Packet.T) is
   begin
      -- Push the argument onto the test history for looking at later:
      Self.Ccsds_Space_Packet_T_Recv_Sync_History.Push (Arg);
   end Ccsds_Space_Packet_T_Recv_Sync;

   -- Ccsds packets not found in the routing table are forwarded out this connector if it is connected.
   overriding procedure Unrecognized_Ccsds_Space_Packet_T_Recv_Sync (Self : in out Instance; Arg : in Ccsds_Space_Packet.T) is
   begin
      -- Push the argument onto the test history for looking at later:
      Self.Unrecognized_Ccsds_Space_Packet_T_Recv_Sync_History.Push (Arg);
   end Unrecognized_Ccsds_Space_Packet_T_Recv_Sync;

   -- Events are sent out of this connector.
   overriding procedure Event_T_Recv_Sync (Self : in out Instance; Arg : in Event.T) is
   begin
      -- Push the argument onto the test history for looking at later:
      Self.Event_T_Recv_Sync_History.Push (Arg);
      -- Dispatch the event to the correct handler:
      Self.Dispatch_Event (Arg);
   end Event_T_Recv_Sync;

   -- Error packets are sent out of this connector.
   overriding procedure Packet_T_Recv_Sync (Self : in out Instance; Arg : in Packet.T) is
   begin
      -- Push the argument onto the test history for looking at later:
      Self.Packet_T_Recv_Sync_History.Push (Arg);
      -- Dispatch the packet to the correct handler:
      Self.Dispatch_Packet (Arg);
   end Packet_T_Recv_Sync;

   -- The system time is retrieved via this connector.
   overriding function Sys_Time_T_Return (Self : in out Instance) return Sys_Time.T is
      To_Return : Sys_Time.T;
   begin
      -- Return the system time:
      To_Return := Self.System_Time;
      -- Push the argument onto the test history for looking at later:
      Self.Sys_Time_T_Return_History.Push (To_Return);
      return To_Return;
   end Sys_Time_T_Return;

   ---------------------------------------
   -- Extra invokee connector primitives:
   ---------------------------------------
   function Ccsds_Space_Packet_T_Recv_Sync_1 (Class_Self : in out Component.Core_Instance'Class; Arg : in Ccsds_Space_Packet.T; Ignore_Index : in Connector_Index_Type; Ignore : in Connector_Types.Full_Queue_Action := Connector_Types.Drop) return Connector_Types.Connector_Status is
      Self : Instance renames Instance (Class_Self);
   begin
      -- Push the argument onto the test history for looking at later:
      Instance'Class (Self).Ccsds_Space_Packet_T_Recv_Sync_1_History.Push (Arg);
      return Connector_Types.Success;
   end Ccsds_Space_Packet_T_Recv_Sync_1;

   function Ccsds_Space_Packet_T_Recv_Sync_2 (Class_Self : in out Component.Core_Instance'Class; Arg : in Ccsds_Space_Packet.T; Ignore_Index : in Connector_Index_Type; Ignore : in Connector_Types.Full_Queue_Action := Connector_Types.Drop) return Connector_Types.Connector_Status is
      Self : Instance renames Instance (Class_Self);
   begin
      -- Push the argument onto the test history for looking at later:
      Instance'Class (Self).Ccsds_Space_Packet_T_Recv_Sync_2_History.Push (Arg);
      return Connector_Types.Success;
   end Ccsds_Space_Packet_T_Recv_Sync_2;

   function Ccsds_Space_Packet_T_Recv_Sync_3 (Class_Self : in out Component.Core_Instance'Class; Arg : in Ccsds_Space_Packet.T; Ignore_Index : in Connector_Index_Type; Ignore : in Connector_Types.Full_Queue_Action := Connector_Types.Drop) return Connector_Types.Connector_Status is
      Self : Instance renames Instance (Class_Self);
   begin
      -- Push the argument onto the test history for looking at later:
      Instance'Class (Self).Ccsds_Space_Packet_T_Recv_Sync_3_History.Push (Arg);
      return Connector_Types.Success;
   end Ccsds_Space_Packet_T_Recv_Sync_3;

   function Ccsds_Space_Packet_T_Recv_Sync_4 (Class_Self : in out Component.Core_Instance'Class; Arg : in Ccsds_Space_Packet.T; Ignore_Index : in Connector_Index_Type; Ignore : in Connector_Types.Full_Queue_Action := Connector_Types.Drop) return Connector_Types.Connector_Status is
      Self : Instance renames Instance (Class_Self);
   begin
      -- Push the argument onto the test history for looking at later:
      Instance'Class (Self).Ccsds_Space_Packet_T_Recv_Sync_4_History.Push (Arg);
      return Connector_Types.Success;
   end Ccsds_Space_Packet_T_Recv_Sync_4;

   function Ccsds_Space_Packet_T_Recv_Sync_5 (Class_Self : in out Component.Core_Instance'Class; Arg : in Ccsds_Space_Packet.T; Ignore_Index : in Connector_Index_Type; Ignore : in Connector_Types.Full_Queue_Action := Connector_Types.Drop) return Connector_Types.Connector_Status is
      Self : Instance renames Instance (Class_Self);
   begin
      -- Push the argument onto the test history for looking at later:
      Instance'Class (Self).Ccsds_Space_Packet_T_Recv_Sync_5_History.Push (Arg);
      return Connector_Types.Success;
   end Ccsds_Space_Packet_T_Recv_Sync_5;

   function Ccsds_Space_Packet_T_Recv_Sync_6 (Class_Self : in out Component.Core_Instance'Class; Arg : in Ccsds_Space_Packet.T; Ignore_Index : in Connector_Index_Type; Ignore : in Connector_Types.Full_Queue_Action := Connector_Types.Drop) return Connector_Types.Connector_Status is
      Self : Instance renames Instance (Class_Self);
   begin
      -- Push the argument onto the test history for looking at later:
      Instance'Class (Self).Ccsds_Space_Packet_T_Recv_Sync_6_History.Push (Arg);
      return Connector_Types.Success;
   end Ccsds_Space_Packet_T_Recv_Sync_6;

   ---------------------------------------
   -- Invoker connector primitives:
   ---------------------------------------
   -- This procedure is called when a Ccsds_Space_Packet_T_Send_2 message is dropped due to a full queue.
   overriding procedure Ccsds_Space_Packet_T_Send_2_Dropped (Self : in out Instance; Arg : in Ccsds_Space_Packet.T) is
      Ignore : Ccsds_Space_Packet.T renames Arg;
   begin
      if not Self.Expect_Ccsds_Space_Packet_T_Send_2_Dropped then
         pragma Assert (False, "The component's queue filled up when Ccsds_Space_Packet_T_Send_2 was called!");
      else
         Self.Ccsds_Space_Packet_T_Send_2_Dropped_Count := @ + 1;
         Self.Expect_Ccsds_Space_Packet_T_Send_2_Dropped := False;
      end if;
   end Ccsds_Space_Packet_T_Send_2_Dropped;

   -----------------------------------------------
   -- Event handler primitive:
   -----------------------------------------------
   -- A packet was received with an APID that was not found in the routing table. The packet was dropped.
   overriding procedure Unrecognized_Apid (Self : in out Instance; Arg : Ccsds_Primary_Header.T) is
   begin
      -- Push the argument onto the test history for looking at later:
      Self.Unrecognized_Apid_History.Push (Arg);
   end Unrecognized_Apid;

   -- The component's queue overflowed and a packet with the following header was dropped.
   overriding procedure Dropped_Packet (Self : in out Instance; Arg : Ccsds_Primary_Header.T) is
   begin
      -- Push the argument onto the test history for looking at later:
      Self.Dropped_Packet_History.Push (Arg);
   end Dropped_Packet;

   -- A packet with an unexpected sequence count was received.
   overriding procedure Unexpected_Sequence_Count_Received (Self : in out Instance; Arg : Unexpected_Sequence_Count.T) is
   begin
      -- Push the argument onto the test history for looking at later:
      Self.Unexpected_Sequence_Count_Received_History.Push (Arg);
   end Unexpected_Sequence_Count_Received;

   -- The component's received two or more packets in a row with identical sequence counts. The duplicate packet was dropped.
   overriding procedure Dropped_Duplicate_Packet (Self : in out Instance; Arg : Ccsds_Primary_Header.T) is
   begin
      -- Push the argument onto the test history for looking at later:
      Self.Dropped_Duplicate_Packet_History.Push (Arg);
   end Dropped_Duplicate_Packet;

   -----------------------------------------------
   -- Packet handler primitive:
   -----------------------------------------------
   -- Description:
   --    Packets for the CCSDS Router component.
   -- This packet contains a CCSDS packet that was dropped due to error.
   overriding procedure Error_Packet (Self : in out Instance; Arg : Ccsds_Space_Packet.T) is
   begin
      -- Push the argument onto the test history for looking at later:
      Self.Error_Packet_History.Push (Arg);
   end Error_Packet;

   -----------------------------------------------
   -- Special primitives for activating component
   -- queues:
   -----------------------------------------------
   -- Force the component to drain the entire queue
   not overriding function Dispatch_All (Self : in out Instance) return Natural is
      Num_Dispatched : Natural;
   begin
      Self.Log ("    Dispatching all items off queue.");
      Num_Dispatched := Self.Component_Instance.Dispatch_All;
      Self.Log ("    Dispatched " & String_Util.Trim_Both (Natural'Image (Num_Dispatched)) & " items from queue.");
      return Num_Dispatched;
   end Dispatch_All;

   not overriding function Dispatch_N (Self : in out Instance; N : in Positive := 1) return Natural is
      Num_Dispatched : Natural;
   begin
      Self.Log ("    Dispatching up to " & String_Util.Trim_Both (Positive'Image (N)) & " items from queue.");
      Num_Dispatched := Self.Component_Instance.Dispatch_N (N);
      Self.Log ("    Dispatched " & String_Util.Trim_Both (Natural'Image (Num_Dispatched)) & " items from queue.");
      return Num_Dispatched;
   end Dispatch_N;

end Component.Ccsds_Router.Implementation.Tester;
