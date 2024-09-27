{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest_vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "gmock_vendor" = substituteSource {
      src = fetchgit {
        name = "gmock_vendor-source";
        url = "https://github.com/ros2-gbp/googletest-release.git";
        rev = "c60fba5e11ad4a220c21762d27d29fb55ae7658d";
        hash = "sha256-PO/ALDgFYiKLU8D1fDgoIVSAMJ3CCBpN60MYHS42E10=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "gmock_vendor";
  version = "1.15.0-1";
  src = sources."gmock_vendor";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gtest_vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gtest_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The package provides GoogleMock.";
  };
}
