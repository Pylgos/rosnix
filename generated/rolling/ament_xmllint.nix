{
  ament_copyright,
  ament_flake8,
  ament_lint,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libxml2,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_xmllint = substituteSource {
      src = fetchgit {
        name = "ament_xmllint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "84607fc57a1e0cf53fb28526ad853e08a4effa39";
        hash = "sha256-AshFyemvrWDfYXoO3xXjMCSX39tUj/212f9wqUouQAQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_xmllint";
  version = "0.18.1-1";
  src = sources.ament_xmllint;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_lint libxml2 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint libxml2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to check XML files like the package manifest using xmllint and generate xUnit test result files.";
  };
}
