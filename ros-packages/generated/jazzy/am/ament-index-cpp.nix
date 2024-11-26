{
  ament-cmake,
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
  version = "1.8.1-1";
  src = finalAttrs.passthru.sources."ament_index_cpp";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_index_cpp" = substituteSource {
        src = fetchgit {
          name = "ament_index_cpp-source";
          url = "https://github.com/ros2-gbp/ament_index-release.git";
          rev = "3c5dd9ddaad1ddb13eb85b7daa7c117fc8b5bf87";
          hash = "sha256-ytQU6fmD13UGKlhbYq0WhC1KBdHZXHsuK7M+iNihXkk=";
        };
      };
    });
  };
  meta = {
    description = "C++ API to access the ament resource index.";
  };
})
