{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-pclint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_pclint";
  version = "0.21.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_pclint";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-pclint ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-pclint ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_pclint" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pclint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "c8179d11479b0a8d37a0e809f63fba5c5dc0ab04";
        hash = "sha256-G8VNRnkE46cHiHrklxWEhXnx4X+NfBKfOiCSE9AvriY=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_pclint to perform static code analysis on C/C++\n    code using PC-lint.\n  ";
  };
})
