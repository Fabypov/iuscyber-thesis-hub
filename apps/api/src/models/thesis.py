import uuid
from datetime import datetime
from sqlalchemy import Column, String, Integer, JSON, ForeignKey, DateTime
from sqlalchemy.orm import relationship
from src.core.database import Base

class ThesisProject(Base):
    __tablename__ = "thesis_projects"
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    owner_id = Column(String, ForeignKey("users.id"))
    title = Column(String, nullable=False)
    topic = Column(String)
    status = Column(String)
    apa_mode = Column(String, default="strict")
    config_json = Column(JSON, default={})
    
    chapters = relationship("ThesisChapter", back_populates="project")

class ThesisChapter(Base):
    __tablename__ = "thesis_chapters"
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    project_id = Column(String, ForeignKey("thesis_projects.id"))
    parent_id = Column(String, ForeignKey("thesis_chapters.id"), nullable=True)
    chapter_order = Column(Integer)
    title = Column(String)
    content = Column(String)
    
    project = relationship("ThesisProject", back_populates="chapters")
    subchapters = relationship("ThesisChapter", back_populates="parent", remote_side=[id])
    parent = relationship("ThesisChapter", back_populates="subchapters", remote_side=[parent_id])

class ThesisVersion(Base):
    __tablename__ = "thesis_versions"
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    project_id = Column(String, ForeignKey("thesis_projects.id"))
    version_label = Column(String)
    snapshot_json = Column(JSON)
    created_at = Column(DateTime, default=datetime.utcnow)
