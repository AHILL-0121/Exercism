export class GradeSchool {
  constructor() {
    this.grades = new Map();
  }

  add(name, grade) {
    const allStudents = this.roster();
    if (allStudents.includes(name)) {
      return false;
    }
    if (!this.grades.has(grade)) {
      this.grades.set(grade, []);
    }
    this.grades.get(grade).push(name);
    return true;
  }

  grade(grade) {
    const students = this.grades.get(grade) || [];
    return [...students].sort();
  }

  roster() {
    const sortedGrades = [...this.grades.keys()].sort((a, b) => a - b);
    return sortedGrades.flatMap((g) => this.grade(g));
  }
}