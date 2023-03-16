/*
 * This file is part of "JTA - Telnet/SSH for the JAVA(tm) platform".
 *
 * (c) Matthias L. Jugel, Marcus Meißner 1996-2005. All Rights Reserved.
 *
 * Please visit http://javatelnet.org/ for updates and contact.
 *
 * --LICENSE NOTICE--
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 * --LICENSE NOTICE--
 *
 */
package de.mud.jta.event;

import de.mud.jta.Plugin;
import de.mud.jta.PluginListener;

import java.awt.Dimension;

/**
 * This is the interface for a focus status listener.
 * <P>
 * <B>Maintainer:</B> Matthias L. Jugel
 *
 * @version $Id: FocusStatusListener.java,v 1.1 2009/02/09 06:57:28 kim4989 Exp $
 * @author Matthias L. Jugel, Marcus Mei�ner
 */
public interface FocusStatusListener extends PluginListener {
  /** Called if a plugin gained the input focus. */
  public void pluginGainedFocus(Plugin plugin);
  /** Called if a plugin lost the input focus. */
  public void pluginLostFocus(Plugin plugin);
}
