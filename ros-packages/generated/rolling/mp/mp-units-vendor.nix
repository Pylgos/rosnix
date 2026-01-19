{
  ament-cmake,
  ament-cmake-vendor-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mp_units_vendor";
  version = "2.5.0-2";
  src = finalAttrs.passthru.sources."mp_units_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "libgsl" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "libgsl" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mp_units_vendor" = substituteSource {
      src = fetchgit {
        name = "mp_units_vendor-source";
        url = "https://github.com/ros2-gbp/mp_units_vendor-release.git";
        rev = "2c927771c571385b8bc5c86a15605d06655a1066";
        hash = "sha256-MD2T1tQVBQlr3t3+PkPDxEOpeFbpEepuegp0kKEntVI=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_TYPE git";
          to = "";
        }
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/mpusz/mp-units.git";
          to = "VCS_TYPE path VCS_URL ${sources."mp_units_vendor/mp-units"}";
        }
      ];
    };
    "mp_units_vendor/mp-units" = substituteSource {
      src = fetchgit {
        name = "mp-units-source";
        url = "https://github.com/mpusz/mp-units.git";
        rev = "27d2def9082ce00d7eb4f75695dbead4a748f23f";
        hash = "sha256-HP5eq5NJIAsK3HuTwIvJgt5Y3gSMpmOng+/HDXBv0ZA=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for mp-units (quantities and units library for C++)\n  ";
  };
})
