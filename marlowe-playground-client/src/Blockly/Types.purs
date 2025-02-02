module Blockly.Types where

import Prologue
import Blockly.Events (ChangeEvent, CreateEvent, FinishLoadingEvent, MoveEvent, UIEvent, element, SelectEvent)

foreign import data Blockly :: Type

foreign import data Workspace :: Type

foreign import data Block :: Type

type BlocklyState
  = { blockly :: Blockly
    , workspace :: Workspace
    , rootBlockName :: String
    , blocksElementId :: String
    }

data BlocklyEvent
  = Change ChangeEvent
  | Create CreateEvent
  | Move MoveEvent
  | FinishLoading FinishLoadingEvent
  | UI UIEvent
  | Select SelectEvent

isDragStart :: BlocklyEvent -> Boolean
isDragStart (UI event) = element event == (Just "dragStart")

isDragStart _ = false

isDragStop :: BlocklyEvent -> Boolean
isDragStop (UI event) = element event == (Just "dragStop")

isDragStop _ = false
