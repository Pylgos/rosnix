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
    gtest_vendor-949478db25504854988f1510571c5b93a67f9c4b = substituteSource {
      src = fetchgit {
        name = "gtest_vendor-949478db25504854988f1510571c5b93a67f9c4b-source";
        url = "https://github.com/ros2-gbp/googletest-release.git";
        rev = "949478db25504854988f1510571c5b93a67f9c4b";
        hash = "sha256-hfNPBuRwt4tacGQDjHj0OfgABSsSMXo2L8rlGApqxBc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gtest_vendor";
  version = "1.14.9000-2";
  src = sources.gtest_vendor-949478db25504854988f1510571c5b93a67f9c4b;
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
