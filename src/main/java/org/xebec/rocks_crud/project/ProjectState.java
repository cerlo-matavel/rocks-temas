package org.xebec.rocks_crud.project;

public enum ProjectState {

    SUBMITTED("Submetido"),
    APPROVED("Aprovado"),
    REJECTED("Reprovado");

    private final String projectState;

    ProjectState(String state) {
        this.projectState = state;
    }

    public String getProjectState() {
        return projectState;
    }
}
