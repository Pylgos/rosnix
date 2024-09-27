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
    gtsam-417ef871550e7e13a51a717e2f4b16ebf17e3f81 = substituteSource {
      src = fetchgit {
        name = "gtsam-417ef871550e7e13a51a717e2f4b16ebf17e3f81-source";
        url = "https://github.com/ros2-gbp/gtsam-release.git";
        rev = "417ef871550e7e13a51a717e2f4b16ebf17e3f81";
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
  version = "4.2.0-4";
  src = sources.gtsam-417ef871550e7e13a51a717e2f4b16ebf17e3f81;
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
