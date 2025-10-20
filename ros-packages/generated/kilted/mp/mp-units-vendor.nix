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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."mp_units_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libgsl" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libgsl" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mp_units_vendor" = substituteSource {
      src = fetchgit {
        name = "mp_units_vendor-source";
        url = "https://github.com/ros2-gbp/mp_units_vendor-release.git";
        rev = "1b8d245ff3662498967ba4798e6cf94f53b148a5";
        hash = "sha256-tvljMCBTlYcaXCs4GQ7tMXStB80xAMvwI7s0KmeMPio=";
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
        rev = "6e06eddf205deaf6c2f2f63500c8c70ec220a99f";
        hash = "sha256-BlemzDArgAvCA4o+G2YPG0D+ISMWJsys57MMfugBURo=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for mp-units (quantities and units library for C++)\n  ";
  };
})
