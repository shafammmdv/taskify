package com.taskify.model.user;

import com.taskify.entity.Role;
import lombok.*;
import lombok.experimental.FieldDefaults;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class RoleAuthModel {

    long id;
    String name;

    public RoleAuthModel(Role role) {
        this.id = role.getId();
        this.name = role.getName();
    }
}
