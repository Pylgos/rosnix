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
    gtest_vendor-76baff7823620c1c36ed5464b28bfd8c9b52d081 = substituteSource {
      src = fetchgit {
        name = "gtest_vendor-76baff7823620c1c36ed5464b28bfd8c9b52d081-source";
        url = "https://github.com/ros2-gbp/googletest-release.git";
        rev = "76baff7823620c1c36ed5464b28bfd8c9b52d081";
        hash = "sha256-Zg30M2S4KqWNrzQZyuVcTjvY7oCPPsWbnfMQ+fvV768=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gtest_vendor";
  version = "1.15.0-1";
  src = sources.gtest_vendor-76baff7823620c1c36ed5464b28bfd8c9b52d081;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The package provides GoogleTest.";
  };
}
