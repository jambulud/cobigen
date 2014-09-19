package ${variables.rootPackage}.general.persistence.base;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;
import javax.persistence.Version;

import net.sf.mmm.util.entity.api.MutableGenericEntity;
import net.sf.mmm.util.entity.api.PersistenceEntity;

/**
 * Abstract Entity for all Entities with an id and a version field.
 *
 * @author hohwille
 * @author rjoeris
 */
@MappedSuperclass
public abstract class ${variables.domain?cap_first}PersistenceEntity implements PersistenceEntity<Long>, MutableGenericEntity<Long> {

  private static final long serialVersionUID = 1L;

  /** @see #getId() */
  private Long id;

  /** @see #getModificationCounter() */
  private int modificationCounter;

  /**
   * The constructor.
   */
  public RestaurantPersistenceEntity() {

    super();
  }

  /**
   * {@inheritDoc}
   */
  @Override
  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE)
  public Long getId() {

    return this.id;
  }

  /**
   * {@inheritDoc}
   */
  public void setId(Long id) {

    this.id = id;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  @Column(name = "version")
  @Version
  public int getModificationCounter() {

    return this.modificationCounter;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public void setModificationCounter(int version) {

    this.modificationCounter = version;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  @Transient
  public Number getRevision() {

    return null;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public int hashCode() {

    final int prime = 31;
    int result = 1;
    result = prime * result + ((this.id == null) ? 0 : this.id.hashCode());
    result = prime * result + this.modificationCounter;
    return result;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public boolean equals(Object obj) {

    if (this == obj) {
      return true;
    }
    if (obj == null) {
      return false;
    }
    if (getClass() != obj.getClass()) {
      return false;
    }
    RestaurantPersistenceEntity other = (RestaurantPersistenceEntity) obj;
    if (!Objects.equals(this.id, other.id)) {
      return false;
    }
    if (this.modificationCounter != other.modificationCounter) {
      return false;
    }
    return true;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public String toString() {

    StringBuilder buffer = new StringBuilder();
    toString(buffer);
    return buffer.toString();
  }

  /**
   * Method to extend {@link #toString()} logic.
   *
   * @param buffer is the {@link StringBuilder} where to {@link StringBuilder#append(Object) append} the string
   *        representation.
   */
  protected void toString(StringBuilder buffer) {

    buffer.append(getClass().getSimpleName());
    if (this.id != null) {
      buffer.append("[id=");
      buffer.append(this.id);
      buffer.append("]");
    }
  }

}
