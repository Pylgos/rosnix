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
    gtsam-d3c5f105328d08db8595435da6ea09fc4096300a = substituteSource {
      src = fetchgit {
        name = "gtsam-d3c5f105328d08db8595435da6ea09fc4096300a-source";
        url = "https://github.com/ros2-gbp/gtsam-release.git";
        rev = "d3c5f105328d08db8595435da6ea09fc4096300a";
        hash = "sha256-ERY+Se9DNzpNImwnyrl2UGDHhSxLNmhlIL9anEb/CRg=";
      };
      substitutions = [
        {
          path = "gtsam/3rdparty/Eigen/lapack/CMakeLists.txt";
          from = "DOWNLOAD \"http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz\"";
          to = "DOWNLOAD file://${lapack_addons_3-vendor_source-0g14qljdn9i6zqiplgx4l6nspxyv8qmsa6h435islaa7vjvyv6dx}";
        }
      ];
    };
    lapack_addons_3-vendor_source-0g14qljdn9i6zqiplgx4l6nspxyv8qmsa6h435islaa7vjvyv6dx = substituteSource {
      src = fetchurl {
        name = "lapack_addons_3-vendor_source-0g14qljdn9i6zqiplgx4l6nspxyv8qmsa6h435islaa7vjvyv6dx-source";
        url = "http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz";
        hash = "sha256-vZntt9xHKapjGQQapStG2/erraGkP3oj/iYm2yTFJDw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gtsam";
  version = "4.2.0-6";
  src = sources.gtsam-d3c5f105328d08db8595435da6ea09fc4096300a;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "tbb" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "gtsam";
  };
}
