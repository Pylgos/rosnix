{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    osrf_testing_tools_cpp = substituteSource {
      src = fetchgit {
        name = "osrf_testing_tools_cpp-source";
        url = "https://github.com/ros2-gbp/osrf_testing_tools_cpp-release.git";
        rev = "5ecc33aa92e5f47d455076ace8533a0145c88b54";
        hash = "sha256-Jh4CDB0AzEVKGiQHV2dLXeARF8QEd5zvYEMIHaIP+y8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "osrf_testing_tools_cpp";
  version = "2.0.0-3";
  src = sources.osrf_testing_tools_cpp;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Testing tools for C++, and is used in various OSRF projects.";
  };
}
