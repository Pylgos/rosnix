{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_index_cpp";
  version = "1.11.3-1";
  src = finalAttrs.passthru.sources."ament_index_cpp";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ament_index_cpp" = substituteSource {
      src = fetchgit {
        name = "ament_index_cpp-source";
        url = "https://github.com/ros2-gbp/ament_index-release.git";
        rev = "29756648352e466d313968ac18fa69f56210b5dd";
        hash = "sha256-6cKXliXlI6KKEXdz7df+tWJMXRmcao+gBC/TLMTR9HE=";
      };
    };
  });
  meta = {
    description = "\n    C++ API to access the ament resource index.\n  ";
  };
})
