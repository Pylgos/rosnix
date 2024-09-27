{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    fmi_library-vendor_source-998768cddacce99727d633d045fa6d25314e1d9a = substituteSource {
      src = fetchgit {
        name = "fmi_library-vendor_source-998768cddacce99727d633d045fa6d25314e1d9a-source";
        url = "https://github.com/modelon-community/fmi-library.git";
        rev = "998768cddacce99727d633d045fa6d25314e1d9a";
        hash = "sha256-i8EtjPMg39S/3RyoUaXm5A8Nu/NbgAwjxRCdyh2elyU=";
      };
      substitutions = [
      ];
    };
    fmilibrary_vendor-08f471024647d9a20a30699b327405315a202768 = substituteSource {
      src = fetchgit {
        name = "fmilibrary_vendor-08f471024647d9a20a30699b327405315a202768-source";
        url = "https://github.com/ros2-gbp/fmilibrary_vendor-release.git";
        rev = "08f471024647d9a20a30699b327405315a202768";
        hash = "sha256-RwFS1j6Bue1ac96cXWL4i1A+KcMFWctqGRc0ZGeTR70=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/modelon-community/fmi-library.git";
          to = "URL ${fmi_library-vendor_source-998768cddacce99727d633d045fa6d25314e1d9a}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "fmilibrary_vendor";
  version = "1.0.1-4";
  src = sources.fmilibrary_vendor-08f471024647d9a20a30699b327405315a202768;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wrapper (aka vendor package) around the FMILibrary by Modelon AB (JModelica.org)";
  };
}
