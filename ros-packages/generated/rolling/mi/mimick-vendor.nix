{
  ament-cmake,
  ament-cmake-vendor-package,
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
  pname = "mimick_vendor";
  version = "0.9.0-1";
  src = finalAttrs.passthru.sources."mimick_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  buildInputs = [ ament-cmake ament-cmake-vendor-package ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mimick_vendor" = substituteSource {
      src = fetchgit {
        name = "mimick_vendor-source";
        url = "https://github.com/ros2-gbp/mimick_vendor-release.git";
        rev = "64d902bc116a3c56b3111c999d41f46806c3aed7";
        hash = "sha256-e7kZxT2+bE+EQF5d2fN5I4V4W5thU8xd/GM3dzW3K00=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/ros2/Mimick.git";
          to = "VCS_TYPE path VCS_URL ${sources."mimick_vendor/Mimick"}";
        }
      ];
    };
    "mimick_vendor/Mimick" = substituteSource {
      src = fetchgit {
        name = "Mimick-source";
        url = "https://github.com/ros2/Mimick.git";
        rev = "1e138b0e13da99278453dc96af954890d9f48348";
        hash = "sha256-V1HudbZtvYwbgUj4LSwUxb7kjtuOm5rcC+kPfTm335I=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around mimick, it provides an ExternalProject build of mimick.\n  ";
  };
})
