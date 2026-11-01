from pathlib import Path

from jianghuvoice.core.database import Database
from jianghuvoice.core.settings import SettingsStore


def test_settings_round_trip(tmp_path: Path) -> None:
    database = Database(tmp_path / "settings.db")
    database.initialize()
    settings = SettingsStore(database)
    assert settings.get("missing", 12) == 12
    settings.set("reader", {"speed": 1.25, "tier": "basic"})
    assert settings.get("reader") == {"speed": 1.25, "tier": "basic"}
