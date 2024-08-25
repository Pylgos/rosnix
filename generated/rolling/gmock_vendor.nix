{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest_vendor,
  substituteSource,
}:
let
  sources = rec {
    gmock_vendor = substituteSource {
      src = fetchgit {
        name = "gmock_vendor-source";
        url = "https://github.com/ros2-gbp/googletest-release.git";
        rev = "c60fba5e11ad4a220c21762d27d29fb55ae7658d";
        hash = "sha256-PO/ALDgFYiKLU8D1fDgoIVSAMJ3CCBpN60MYHS42E10=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gmock_vendor";
  version = "1.15.0-1";
  src = sources.gmock_vendor;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ gtest_vendor ];
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ gtest_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The package provides GoogleMock.";
  };
}
